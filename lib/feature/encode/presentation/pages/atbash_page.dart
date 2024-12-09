import 'package:encode_decode_app/core/enums.dart';
import 'package:encode_decode_app/core/widgets/custom_text_box.dart';
import 'package:encode_decode_app/feature/encode/presentation/providers/encryption_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AtbashPage extends StatefulWidget {
  AtbashPage({super.key, required this.cipher});

  Cipher cipher;

  @override
  State<AtbashPage> createState() => _AtbashPageState();
}

class _AtbashPageState extends State<AtbashPage> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _resultController = TextEditingController();
  late EncryptionProvider _encryptionProvider;

  @override
  void initState() {
    _encryptionProvider =
        Provider.of<EncryptionProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? result = context.watch<EncryptionProvider>().result;
    if (result != null) _resultController.text = result;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.cipher.name.toUpperCase()} CIPHER',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 17, 42, 47),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextBox(
              label: 'Text',
              controller: _textController,
            ),
            CustomTextBox(
              label: 'Key',
              controller: _keyController,
            ),
            CustomTextBox(
              label: 'Result',
              controller: _resultController,
            ),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Column _buildButtons() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          width: 150,
          height: 45,
          constraints: const BoxConstraints(maxHeight: 45, maxWidth: 150),
          child: ElevatedButton(
            onPressed: () {
              _encryptionProvider.text = _textController.text;
              _encryptionProvider.convert(
                  cipher: Cipher.atbash, encryption: Encryption.encrypt);
            },
            child: const Text('Encrypt'),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: 150,
          height: 45,
          constraints: const BoxConstraints(maxHeight: 45, maxWidth: 150),
          child: ElevatedButton(
            onPressed: () {
              _encryptionProvider.text = _textController.text;
              _encryptionProvider.convert(
                  cipher: Cipher.atbash, encryption: Encryption.decrypt);
            },
            child: const Text('Descrypt'),
          ),
        ),
      ],
    );
  }
}
