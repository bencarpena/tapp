#!/usr/bin/env python3
# fernet_tool.py
# Usage:
#   python fernet_tool.py "<text>" "<code>" encrypt
#   python fernet_tool.py "<token>" "<code>" decrypt
# Tip: Use '-' as the first arg to read the text from STDIN.

import sys
import base64
import hashlib
from typing import Literal
from cryptography.fernet import Fernet, InvalidToken

Mode = Literal["encrypt", "decrypt"]

def derive_fernet_key(code: str) -> bytes:
    """
    Derive a Fernet-compatible key from an arbitrary passphrase-like 'code'.
    This uses SHA-256 over the UTF-8 bytes of the code, then urlsafe base64 encodes
    the 32-byte digest to the 44-byte Fernet key format.
    """
    digest = hashlib.sha256(code.encode("utf-8")).digest()  # 32 bytes
    return base64.urlsafe_b64encode(digest)  # Fernet expects base64 urlsafe-encoded 32 bytes

def encrypt_string(plaintext: str, code: str) -> str:
    key = derive_fernet_key(code)
    f = Fernet(key)
    token = f.encrypt(plaintext.encode("utf-8"))
    return token.decode("utf-8")

def decrypt_string(token: str, code: str) -> str:
    key = derive_fernet_key(code)
    f = Fernet(key)
    try:
        plaintext = f.decrypt(token.encode("utf-8"))
        return plaintext.decode("utf-8")
    except InvalidToken as e:
        raise ValueError("Decryption failed: invalid token or wrong code.") from e

def main():
    if len(sys.argv) != 4:
        print(
            "Usage:\n"
            "  python fernet_tool.py \"<text-or-token>\" \"<code>\" encrypt|decrypt\n"
            "Notes:\n"
            "  - First argument is the string to encrypt (for 'encrypt') or the token to decrypt (for 'decrypt').\n"
            "  - Second argument is your shared 'code' used to derive the Fernet key.\n"
            "  - Third argument is the mode: encrypt or decrypt.\n"
            "  - Use '-' as the first argument to read input from STDIN.",
            file=sys.stderr,
        )
        sys.exit(1)

    text_or_token, code, mode = sys.argv[1], sys.argv[2], sys.argv[3].lower()

    # Allow reading the first argument from STDIN if '-'
    if text_or_token == "-":
        text_or_token = sys.stdin.read()

    if mode not in ("encrypt", "decrypt"):
        print("Error: mode must be 'encrypt' or 'decrypt'.", file=sys.stderr)
        sys.exit(1)

    try:
        if mode == "encrypt":
            out = encrypt_string(text_or_token, code)
        else:
            out = decrypt_string(text_or_token, code)
        print(out)
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
