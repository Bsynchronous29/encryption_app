class VigenereCipher {
  // Encrypt the plaintext using the key
  static String encrypt(String plaintext, String key) {
    final formattedKey = _formatKey(text: plaintext, key: key);
    return _applyCipher(plaintext, formattedKey, encrypt: true);
  }

  // Decrypt the ciphertext using the key
  static String decrypt(String ciphertext, String key) {
    final formattedKey = _formatKey(text: ciphertext, key: key);
    return _applyCipher(ciphertext, formattedKey, encrypt: false);
  }

  // Helper function to format the key to match the length of the text
  static String _formatKey({required String text, String key = ''}) {
    key = key.toUpperCase();
    final keyBuilder = StringBuffer();
    int keyIndex = 0;

    for (int i = 0; i < text.length; i++) {
      if (_isAlphabet(text[i])) {
        keyBuilder.write(key[keyIndex % key.length]);
        keyIndex++;
      } else {
        keyBuilder.write(text[i]); // Retain non-alphabet characters
      }
    }
    return keyBuilder.toString();
  }

  // Apply the cipher (encryption or decryption)
  static String _applyCipher(String text, String key, {required bool encrypt}) {
    final textBuffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      if (_isAlphabet(text[i])) {
        final textChar = text[i].toUpperCase();
        final keyChar = key[i];
        final shift =
            (keyChar.codeUnitAt(0) - 'A'.codeUnitAt(0)) * (encrypt ? 1 : -1);

        final newChar = String.fromCharCode(
          ((textChar.codeUnitAt(0) - 'A'.codeUnitAt(0) + shift + 26) % 26) +
              'A'.codeUnitAt(0),
        );

        textBuffer.write(newChar);
      } else {
        textBuffer.write(text[i]); // Retain non-alphabet characters
      }
    }

    return textBuffer.toString();
  }

  // Check if a character is an alphabet
  static bool _isAlphabet(String char) {
    return RegExp(r'[A-Za-z]').hasMatch(char);
  }
}
