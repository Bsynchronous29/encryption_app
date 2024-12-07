class AtbashCipher {
  // Encrypt or decrypt (same operation for Atbash Cipher)
  static String cipher(String input) {
    final buffer = StringBuffer();

    for (int i = 0; i < input.length; i++) {
      final char = input[i];
      if (_isAlphabet(char)) {
        final baseCode =
            _isUpperCase(char) ? 'A'.codeUnitAt(0) : 'a'.codeUnitAt(0);
        final reversedChar = String.fromCharCode(
          baseCode + (25 - (char.codeUnitAt(0) - baseCode)),
        );
        buffer.write(reversedChar);
      } else {
        buffer.write(char); // Preserve non-alphabet characters
      }
    }

    return buffer.toString();
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
