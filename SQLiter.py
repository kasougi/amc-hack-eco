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
    def send_user(self, name, last_name, email):
        self.cursor.execute(
            f"INSERT INTO user (name, last_name, email) VALUES('{name}', '{last_name}', '{email}')")
        self.connection.commit()

    # Вставка в БД новой заявки
    def send_request(self, user_id, tag_id, photo_url, description, lat, log, moderation, token_id,  date, radius):
        self.cursor.execute(
            f"INSERT INTO request (user_id, photo_url,  description, lat, log, moderation, token_id, date, radius) VALUES('{user_id}', '{tag_id}'"
            f"'{photo_url}', '{description}', '{lat}', '{log}', '{moderation}', '{token_id}', '{date}', '{radius}')")
        request_id = self.cursor.execute(
            f"SELECT id FROM request WHERE user_id = 'user_id' AND photo_url = 'photo_url' AND description = 'description'"
            f"AND lat = 'lat' AND log = 'log' AND moderation = 'moderation' AND token_id = 'token_id'"
            f" AND date = 'date' AND radius = 'radius'").fetchall()
        self.connection.commit()
        return request_id


    def between_lat_log(self, id, lat, log):
        half = 1 * 0,1988
        id = self.cursor.execute(
            f"SELECT id FROM request WHERE lat BETWEEN  '{lat}' - '{half}' AND '{lat}' + '{half}'"
            f"    AND log BETWEEN '{lat}' - '{half}' AND '{lat}' + '{half}')")
        self.cursor.execute(
            f"UPDATE request"
            f"SET radius_par = {max(id)}"
            f"WHERE '{id}' = 4")
        self.connection.commit()


    def send_category(self, category_name):
        """
        Добавляет категорию
        :param category_name:
        :return:
        """
        self.cursor.execute(
            f"INSERT INTO training_category (name) VALUES('{category_name}')")
        self.connection.commit()

    def send_progres(self, user_id, date, completed):
        """
        Добавляет прошресс юзера
        """
        self.cursor.execute(
            f"INSERT INTO progress (user_token, date, completed) VALUES('{user_id}', '{date}', '{completed}')")
        self.connection.commit()

    def send_sber_id(self, sber_id):
        """
        Вставка в БД нового пользователя
        :param int: id пользователя
        """
        self.cursor.execute(
            f"INSERT INTO devise (sber_id) VALUES('{sber_id}')")
        self.connection.commit()



    def get_all_category(self):
        """
        Достает все категории
        """
        category = self.cursor.execute(
            f"SELECT * FROM training_category").fetchall()
        result = []
        for i in range(len(category)):
            res = dict()
            res["id"] = category[i][0]
            res["name"] = category[i][1]
            result.append(res)
        return result

    def get_progres_by_user(self, user_token):
        """
        Достает прогрес юзера
        """
        progres = self.cursor.execute(
            f"SELECT * FROM progress WHERE user_token = '{user_token}'").fetchall()
        result = []
        for progres_day in progres:
            res = dict()
            res["id"] = progres_day[0]
            res["user_id"] = progres_day[1]
            res["date"] = progres_day[2]
            res["completed"] = progres_day[3]
            result.append(res)
        return result

    def get_category_by_id(self, category_id):
        """
        Достает категорию по айди
        """
        category = self.cursor.execute(
            f"SELECT * FROM training_category WHERE id = '{category_id}'").fetchall()
        result = []
        for i in range(len(category)):
            res = dict()
            res["id"]=category[i][0]
            res["name"] = category[i][1]
            result.append(res)
        return result

    def get_all_group(self):
        """
        Достает все группы
        """
        group = self.cursor.execute(
            f"SELECT * FROM training_group").fetchall()
        result = []
        for i in range(len(group)):
            res = dict()
            res['id'] = group[i][0]
            res["name"] = group[i][1]
            res["short_discription"] = group[i][2]
            res["discription"] = group[i][3]
            result.append(res)
        return result

    def get_exircices_from_group(self, group_id):
        """
        Достает задания одной группы
        """

        exircices_id = self.cursor.execute(
            f"SELECT training_id FROM training_training_group WHERE training_group_id = '{group_id}'").fetchall()
        result = []
        for exircices in exircices_id:
            ex_id = exircices[0]
            ex = self.cursor.execute(
                f"SELECT * FROM training WHERE id = '{ex_id}'").fetchall()
            res = dict()
            res["id"] = ex[0][0]
            res["category"] = self.cursor.execute(
                f"SELECT name FROM training_category WHERE id = '{ex[0][1]}'").fetchall()[0][0]
            res["name"] = ex[0][2]
            res["discription"] = ex[0][3]
            res["photo"] = ex[0][4]
            res["time"] = ex[0][5]
            result.append(res)
        return result

    def get_sber_id(self, sber_id):
        """
        Вставка в БД нового пользователя
        :param int: id пользователя
        """
        devise = self.cursor.execute(
            f"SELECT * FROM devise WHERE sber_id = '{sber_id}'").fetchall()
        return devise

    def get_motivations_id(self, id):
        """
        Достает мотивационную фразу из бд
        """
        phras = self.cursor.execute(
            f"SELECT * FROM motivation WHERE id = '{id}'").fetchall()
        result = []
        res = dict()
        res["id"] = phras[0][0]
        res["name"] = phras[0][1]
        res["discription"] = phras[0][2]
        res["author"] = phras[0][3]
        result.append(res)
        return result


    def close(self):
        """ Закрываем текущее соединение с БД """
        self.connection.close()