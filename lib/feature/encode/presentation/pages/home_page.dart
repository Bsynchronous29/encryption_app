import 'package:encode_decode_app/core/enums.dart';
import 'package:encode_decode_app/core/widgets/custom_text_box.dart';
import 'package:encode_decode_app/feature/encode/presentation/providers/atbash_cipher.dart';
import 'package:encode_decode_app/feature/encode/presentation/providers/ceasar_cipher.dart';
import 'package:encode_decode_app/feature/encode/presentation/providers/vigenere_cipher.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.cipher});

  Cipher cipher;
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
  void initState() {
    _selectedCipher = widget.cipher;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: Text(
          '${formatEnum(_selectedCipher)} Cipher'.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.lightBlue[200],
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    CustomTextBox(
                      label: 'Text',
                      controller: _textEditingController,
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                    if (_selectedCipher != Cipher.atbash)
                      CustomTextBox(
                        label:
                            _selectedCipher != Cipher.caeser ? 'Key' : 'Shifts',
                        controller: _keyEditingController,
                        labelStyle: const TextStyle(color: Colors.black),
                      ),
                    CustomTextBox(
                      readOnly: false,
                      label: 'Result',
                      controller: _resultEditingController,
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 200,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Color.fromARGB(255, 36, 82, 92),
                              ),
                              foregroundColor:
                                  WidgetStatePropertyAll(Colors.white)),
                          onPressed: () {
                            _selectedEncryption = Encryption.encrypt;
                            _convert();
                          },
                          child: const Text('ENCRYPT')),
                    ),
                    Container(
                      width: 200,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Color.fromARGB(255, 36, 82, 92),
                              ),
                              foregroundColor:
                                  WidgetStatePropertyAll(Colors.white)),
                          onPressed: () {
                            _selectedEncryption = Encryption.decrypt;
                            _convert();
                          },
                          child: const Text('DECRYPT')),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              child: Stack(
                children: [
                  // First cloud
                  Positioned(
                    bottom: -100, // Position relative to the bottom
                    left: -200, // Adjust horizontal position
                    child: const Image(
                      image: AssetImage('assets/clouds.png'),
                      width: 400, // Adjust size
                    ),
                  ),
                  // Second cloud
                  Positioned(
                    bottom: -100, // Position relative to the bottom
                    left: 60, // Adjust horizontal position
                    child: const Image(
                      image: AssetImage('assets/clouds.png'),
                      width: 400, // Adjust size
                    ),
                  ),
                ],
              ),
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
