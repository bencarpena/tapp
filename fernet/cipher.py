#!/usr/bin/env python3
# cipher.py

import sys
import base64
import hashlib
import getpass
from typing import Literal
from cryptography.fernet import Fernet, InvalidToken

Mode = Literal["encrypt", "decrypt"]

BANNER = r"""
###############################################################
#                                                             #
#          C I P H E R    by    @bschwarzchild                #
#                                                             #
###############################################################
"""

def derive_fernet_key(code: str) -> bytes:
    """Derive a Fernet-compatible key from a passphrase-like 'code'."""
    digest = hashlib.sha256(code.encode("utf-8")).digest()  # 32 bytes
    return base64.urlsafe_b64encode(digest)

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
    print(BANNER)

    if len(sys.argv) != 2:
        print(
            "🔐 Usage:\n"
            "     python3 cipher.py encrypt\n"
            "     python3 cipher.py decrypt",
            file=sys.stderr
        )
        sys.exit(1)

    mode = sys.argv[1].lower()
    if mode not in ("encrypt", "decrypt"):
        print("❌ Error: mode must be 'encrypt' or 'decrypt'.", file=sys.stderr)
        sys.exit(1)

    # Dynamic prompt based on mode
    if mode == "encrypt":
        text_or_token = input("🚀 Enter text to encrypt: ").strip()
    else:
        text_or_token = input("📜 Enter token to decrypt: ").strip()

    code = getpass.getpass("🤖 Enter secret code: ")

    try:
        if mode == "encrypt":
            out = encrypt_string(text_or_token, code)
        else:
            out = decrypt_string(text_or_token, code)
        print(f"\n✅ Result:\n{out}\n")
    except Exception as e:
        print(f"❌ Error: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
