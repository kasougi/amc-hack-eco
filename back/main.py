from fastapi import FastAPI
from Model import RegistrationForm, RequestForm
from ManageLocation import Location
from SQLiter import SQLighter

app = FastAPI()


# id: int, name: str, last_name: str, email: str, token_id: int
@app.post('/registration')
def user_registration(reg_form: RegistrationForm):
    db_worker = SQLighter("Maindatabase.db")
    db_worker.send_user(reg_form.name, reg_form.last_name, reg_form.email)
    db_worker.close()
    return {'1' : '1'}


@app.post('/request')
def user_request(request_form: RequestForm):
    db_worker = SQLighter("Maindatabase.db")
    request_id = db_worker.send_request(request_form.user_id, request_form.tag_id, request_form.photo_url,
                           request_form.description, request_form.lat, request_form.log, request_form.moderation,
                           request_form.token_id, request_form.date, request_form.radius)
    id_decode = db_worker.between_lat_log(request_id, request_form.lat, request_form.log)
    db_worker.close()
    return request_id

@app.get('/range')
def get_range():
    db_worker = SQLighter("Maindatabase.db")
    request_id = db_worker.get_range()
    return request_id

@app.get('/check_loc')
def get_check_loc(location1: str, location2: str):
    loc = Location(location1, location2)
    place = loc.locationObject()
    return place['plus_code']['compound_code']


@app.get('/request_by_user')
def get_request_by_user(user_id: int):
    db_worker = SQLighter("Maindatabase.db")
    result = db_worker.get_requests(user_id)
    db_worker.close()
    return result
