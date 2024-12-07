import 'package:encode_decode_app/core/enums.dart';
import 'package:encode_decode_app/core/widgets/custom_text_box.dart';
import 'package:encode_decode_app/feature/encode/presentation/providers/atbash_cipher.dart';
import 'package:encode_decode_app/feature/encode/presentation/providers/ceasar_cipher.dart';
import 'package:encode_decode_app/feature/encode/presentation/providers/vigenere_cipher.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Cipher _selectedCipher = Cipher.caeser;
  Encryption _selectedEncryption = Encryption.encrypt;
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _keyEditingController = TextEditingController();
  final TextEditingController _resultEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${formatEnum(_selectedCipher)} Cipher'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildCipherChips(),
            CustomTextBox(
              label: 'Text',
              controller: _textEditingController,
              labelStyle: const TextStyle(color: Colors.black),
            ),
            if (_selectedCipher != Cipher.atbash)
              CustomTextBox(
                label: _selectedCipher != Cipher.caeser ? 'Key' : 'Shifts',
                controller: _keyEditingController,
                labelStyle: const TextStyle(color: Colors.black),
              ),
            const SizedBox(height: 10),
            if (_selectedCipher != Cipher.atbash) _buildEncryptionChips(),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: _convert, child: const Text('Show Message')),
            const SizedBox(height: 10),
            CustomTextBox(
              readOnly: false,
              label: 'Result',
              controller: _resultEditingController,
              labelStyle: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  void _convert() {
    String result = '';

    switch (_selectedCipher) {
      case Cipher.vigenere:
        result = _selectedEncryption != Encryption.encrypt
            ? VigenereCipher.decrypt(
                _textEditingController.text, _keyEditingController.text)
            : VigenereCipher.encrypt(
                _textEditingController.text, _keyEditingController.text);
        break;
      case Cipher.caeser:
        result = _selectedEncryption != Encryption.encrypt
            ? CaesarCipher.decrypt(_textEditingController.text,
                int.parse(_keyEditingController.text))
            : CaesarCipher.encrypt(_textEditingController.text,
                int.parse(_keyEditingController.text));
        break;
      case Cipher.atbash:
        result = AtbashCipher.cipher(_textEditingController.text);
        break;
      default:
    }

    setState(() {
      _resultEditingController.text = result;
    });
  }

  Column _buildCipherChips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select Cipher:'),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: Cipher.values
              .map(
                (e) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ChoiceChip(
                    label: Text(formatEnum(e)),
                    selected: _selectedCipher == e,
                    onSelected: (value) => setState(() => _selectedCipher = e),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Column _buildEncryptionChips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select Encryption:'),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: Encryption.values
              .map(
                (e) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ChoiceChip(
                    label: Text(formatEnum(e)),
                    selected: _selectedEncryption == e,
                    onSelected: (value) =>
                        setState(() => _selectedEncryption = e),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
