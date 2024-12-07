class CaesarCipher {
  // Encrypt the plaintext with a given shift value
  static String encrypt(String plaintext, int shift) {
    return _applyCipher(plaintext, shift);
  }

  // Decrypt the ciphertext with a given shift value
  static String decrypt(String ciphertext, int shift) {
    return _applyCipher(ciphertext, -shift);
  }

  // Apply the cipher for both encryption and decryption
  static String _applyCipher(String text, int shift) {
    final textBuffer = StringBuffer();
    shift = shift % 26; // Ensure shift is within the range of the alphabet

    for (int i = 0; i < text.length; i++) {
      final char = text[i];
      if (_isAlphabet(char)) {
        final baseCode =
            _isUpperCase(char) ? 'A'.codeUnitAt(0) : 'a'.codeUnitAt(0);
        final newChar = String.fromCharCode(
          ((char.codeUnitAt(0) - baseCode + shift + 26) % 26) + baseCode,
        );
        textBuffer.write(newChar);
      } else {
        textBuffer.write(char); // Preserve non-alphabet characters
      }
    }

    return textBuffer.toString();
  }

  // Check if a character is an alphabet
  static bool _isAlphabet(String char) {
    return RegExp(r'[A-Za-z]').hasMatch(char);
  }

  // Check if a character is uppercase
  static bool _isUpperCase(String char) {
    return char.toUpperCase() == char;
  }
}
