// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:encode_decode_app/core/enums.dart';
import 'package:encode_decode_app/feature/encode/presentation/providers/atbash_cipher.dart';
import 'package:encode_decode_app/feature/encode/presentation/providers/ceasar_cipher.dart';
import 'package:encode_decode_app/feature/encode/presentation/providers/vigenere_cipher.dart';

class EncryptionProvider extends ChangeNotifier {
  String? text = '';
  String? key = '';
  String? result = '';

  EncryptionProvider({
    this.text,
    this.key,
    this.result,
  });

  void convert({
    required Cipher cipher,
    required Encryption encryption,
  }) {
    String result = '';

    switch (cipher) {
      case Cipher.vigenere:
        result = encryption != Encryption.encrypt
            ? VigenereCipher.decrypt(text!, key!)
            : VigenereCipher.encrypt(text!, key!);
        break;
      case Cipher.caeser:
        result = encryption != Encryption.encrypt
            ? CaesarCipher.decrypt(text!, int.parse(key!))
            : CaesarCipher.encrypt(text!, int.parse(key!));
        break;
      case Cipher.atbash:
        result = AtbashCipher.cipher(text!);
        break;
      default:
    }

    this.result = result;

    notifyListeners();
  }
}
