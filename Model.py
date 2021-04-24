from pydantic import BaseModel

class RegistrationForm(BaseModel):
    name: str
    last_name: str
    email: str


class RequestForm(BaseModel):
    user_id: int
    tag_id: int
    photo_url: str
    description: str  # описание заявки
    lat: str
    log: str
    moderation: int
    token_id: int
    date: str
    radius: int