import requests


class Location:
    url = 'https://maps.googleapis.com/maps/api/geocode/json'  # 55.75320193022759,37.61922086773
    params = {}

    def __init__(self, lat, long):
        self.params['latlng'] = lat + ',' + long
        self.params['language'] = 'ru'
        self.params['key'] = 'AIzaSyBC4xjdes1-RqNY4Ffyr6s_9Ohky6NoRlw'

    def locationObject(self):
        response = requests.get(
            self.url,
            params=self.params,
        )
        return response.json()
