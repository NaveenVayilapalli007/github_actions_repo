from app import process_payment

def test_payment_success():
    assert process_payment(100) == "Payment successful"