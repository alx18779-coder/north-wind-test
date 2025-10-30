from backend.app.core.security import hash_password, verify_password


def test_hash_and_verify_password() -> None:
    plaintext = "s3cret!"
    hashed = hash_password(plaintext)
    assert hashed != plaintext
    assert verify_password(plaintext, hashed)
    assert not verify_password("wrong", hashed)
