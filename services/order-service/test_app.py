from app import create_order

def test_create_order():
    assert create_order("laptop") == "Order created for laptop"