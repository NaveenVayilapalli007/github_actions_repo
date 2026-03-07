def login(username, password):
    if username == "admin" and password == "admin":
        return "Login success"
    return "Login failed"