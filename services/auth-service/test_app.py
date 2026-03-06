from app import login

def test_login_success():
    assert login("admin", "admin") == "Login success"

def test_login_fail():
    assert login("user", "123") == "Login failed"