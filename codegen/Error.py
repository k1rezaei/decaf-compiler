### Error Haro Ba Peygham Bezarid Taa Debug Rahat tar she.
def error(message):
    print(message)
    exit(0)

class TypeError(Exception):
    def __init__(self, message):
        self.message = message