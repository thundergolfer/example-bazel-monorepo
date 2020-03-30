import requests


class Client:
    # TODO(Jonathon): The backend should support HTTPS. Think I just have to turn it on in SpringBoot config
    BASE_URL = "http://api.antilibrary.xyz:8080"  # ⚠️ The backend is not actively maintained and could/will go down sometimes.

    def get_book(self, id: int):
        req_url = f"{self.BASE_URL}/books/{id}"
        resp = requests.get(req_url)
        if resp.status_code == 200:
            return resp.json()
        else:
            raise RuntimeError(resp)


if __name__ == "__main__":
    antilibrary = Client()
    u = antilibrary.get_book(id=1)
    print(u)
