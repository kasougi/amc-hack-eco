import sqlite3


class SQLighter:

    def __init__(self, database):
        self.connection = sqlite3.connect(database)
        self.cursor = self.connection.cursor()

    def get_requests(self, user_id):
        users = self.cursor.execute(f"SELECT * FROM request WHERE user_id = '{user_id}'").fetchall()
        result = []
        for i in range(len(users)):
            res = dict()
            res["id"] = users[i][0]
            res["user_id"] = users[i][1]
            res["tag_id"] = users[i][2]
            res["photo_url"] = users[i][3]
            res["description"] = users[i][4]
            res["lat"] = users[i][5]
            res["log"] = users[i][6]
            res["moderation"] = users[i][7]
            res["token_id"] = users[i][8]
            res["date"] = users[i][9]
            res["radius"] = users[i][10]
            result.append(res)
        return result

    # Вставка в БД нового пользователя
    def send_user(self, name, last_name, email, user_rating= 5):
        self.cursor.execute(
            f"INSERT INTO user (name, last_name, email, rating) VALUES('{name}', '{last_name}', '{email}, '{user_rating}')")
        self.connection.commit()

    # Вставка в БД новой заявки
    def send_request(self, user_id, tag_id, photo_url, description, lat, log, moderation, token_id,  date, radius, radius_par = 0):
        rating = self.getRatingByUsingId(user_id)
        self.cursor.execute(
            f"INSERT INTO request (user_id, tag_id, photo_url,  description, lat, log, moderation, token_id, date, radius, rating_user, radius_par) VALUES('{user_id}', '{tag_id}',"
            f"'{photo_url}', '{description}', '{lat}', '{log}', '{moderation}', '{token_id}', '{date}', '{radius}', '{rating}', '{radius_par}')")

        request_id = self.cursor.execute(
            f"SELECT id FROM request WHERE user_id = '{user_id}' AND photo_url = '{photo_url}' AND description = '{description}'"
            f"AND lat = '{lat}' AND log = '{log}' AND moderation = '{moderation}' AND token_id = '{token_id}'"
            f" AND date = '{date}' AND radius = '{radius}' AND rating_user = '{rating}'").fetchall()
        self.connection.commit()
        id_decode = [request_id[i][0] for i in range(len(request_id))]
        return max(id_decode)

    def getRatingByUsingId(self, user_id):
        result = self.cursor.execute(
            f"SELECT rating FROM user WHERE id = '{user_id}' ").fetchall()
        id_decode = [result[i][0] for i in range(len(result))]
        return max(id_decode)

    def rating_up(self, user_id, num):
        rating = self.getRatingByUsingId(user_id)
        self.cursor.execute
            f"UPDATE user SET rating = '{rating+num}' WHERE id = '{user_id}'")

    def rating_down(self, user_id, num):
        rating = self.getRatingByUsingId(user_id)
        self.cursor.execute
        f"UPDATE user SET rating = '{rating-num}' WHERE id = '{user_id}'")

    def between_lat_log(self, id_req, lat, log):
        half = 1 * 0.1988

        id = self.cursor.execute(
            f"SELECT id FROM request WHERE id < '{id_req}' AND lat BETWEEN  '{float(lat) - half}' AND '{float(lat) + half}'"
            f"    AND log BETWEEN '{float(log) - half}' AND '{float(log) + float(half)}'").fetchall()
        id_decode = [id[i][0] for i in range(len(id))]

        if id_decode != []:
            self.cursor.execute(
                f"UPDATE request SET radius_par = '{max(id_decode)}' WHERE id = '{id_req}'")
        else:
            self.cursor.execute(
                f"UPDATE request SET radius_par = -1 WHERE id = '{id_req}'")
        self.connection.commit()
        return id_decode

    def get_range(self):
        par_id = 12
        result = self.cursor.execute(
            f"SELECT * FROM request ORDER BY id ASC").fetchall()
        resu = []
        for i in range(len(result)):
            res = []
            if(result[i][par_id] !=  0):
                z = 2
                index = i
                while z !=  0:
                    z = result[index][par_id]
                    res.append(result[index])
                    index = z-1
            else: res.append(result[i])
            resu.append(res)
        return resu