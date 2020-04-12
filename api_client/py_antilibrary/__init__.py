import requests

# TODO(Jonathon): The backend should support HTTPS. Think I just have to turn it on in SpringBoot config
# TODO(Jonathon): Better error handling


class Client:
    # ⚠️ The backend is not actively maintained and could/will go down sometimes.
    BASE_URL = "http://api.antilibrary.xyz:8080/v1/"

    def __init__(self, email=None, username=None):
        self.email = email
        self.username = username
        self.user = None
        self._setup_auth()

    def me(self):
        req_url = f"{self.BASE_URL}/users/{self.user['id']}"
        resp = requests.get(req_url)
        if resp.status_code == 200:
            return resp.json()
        else:
            raise RuntimeError(resp)

    def get_book(self, book_id: int):
        req_url = f"{self.BASE_URL}/books/{book_id}"
        resp = requests.get(req_url)
        if resp.status_code == 200:
            return resp.json()
        else:
            raise RuntimeError(resp)

    def _setup_auth(self):
        if not self.email and not self.username:
            return
        req_url = f"{self.BASE_URL}/users"
        resp = requests.get(req_url)
        if resp.status_code == 200:
            users = resp.json()
        else:
            raise RuntimeError(resp)
        # TODO(Jonathon): When auth exists in backend this should do more than just check for 404 and get id
        for u in users:
            if (self.email and u["email"] == self.email) or (
                self.username and u["username"] == self.username
            ):
                self.user = u
                return
        raise RuntimeError(f"User not found for username: {self.username} email: {self.email}")


if __name__ == "__main__":
    antilibrary = Client()
    u = antilibrary.get_book(book_id=1)
    print(u)
