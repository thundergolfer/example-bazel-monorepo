import requests

# TODO(Jonathon): The backend should support HTTPS. Think I just have to turn it on in SpringBoot config


class Client:
    # ⚠️ The backend is not actively maintained and could/will go down sometimes.
    BASE_URL = "http://api.antilibrary.xyz:8080/v1/"

    def __init__(self, email=None, username=None):
        self.email = None
        self.username = None
        self.user_id = None
        self._setup_auth()

    def me(self):
        req_url = f"{self.BASE_URL}/users/{self.user_id}"
        resp = requests.get(req_url)
        if resp.status_code == 200:
            return resp.json()
        else:
            raise RuntimeError(resp)

    def get_book(self, id_: int):
        req_url = f"{self.BASE_URL}/books/{id_}"
        resp = requests.get(req_url)
        if resp.status_code == 200:
            return resp.json()
        else:
            raise RuntimeError(resp)

    def _setup_auth(self):
        if not self.email and not self.username:
            return
        # TODO(Jonathon): When auth exists in backend this should do more than just check for 404 and get id
        raise NotImplementedError


if __name__ == "__main__":
    antilibrary = Client()
    u = antilibrary.get_book(id=1)
    print(u)
