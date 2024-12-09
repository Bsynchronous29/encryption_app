import 'package:encode_decode_app/core/enums.dart';
import 'package:encode_decode_app/feature/encode/presentation/pages/home_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CipherSelectionPage extends StatelessWidget {
  const CipherSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        centerTitle: true,
        title: const Text('Cipher Selection'),
      ),
      body: Container(
        color: Colors.lightBlue[200],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildHeader(),
                    _buildButton(context, text: const Text('ATBASH'),
                        onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            cipher: Cipher.atbash,
                          ),
                        ),
                      );
                    }),
                    _buildButton(context, text: const Text('CEASAR'),
                        onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            cipher: Cipher.caeser,
                          ),
                        ),
                      );
                    }),
                    _buildButton(
                      context,
                      text: const Text('VIRGENERE'),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomePage(
                              cipher: Cipher.vigenere,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
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
      ),
    );
  }

  Column _buildHeader() {
    return Column(
      children: [
        Text(
          'WELCOME',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
        Image(
          matchTextDirection: true,
          image: AssetImage('assets/computer_guy.png'),
          height: 300,
        ),
        Text(
          'CHOOSE A CIPHER',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ],
    );
  }

  Container _buildButton(
    BuildContext context, {
    Widget? text,
    Function()? onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 200,
      height: 45,
      child: ElevatedButton(
        style: const ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          backgroundColor:
              WidgetStatePropertyAll(Color.fromARGB(255, 36, 82, 92)),
        ),
        onPressed: onPressed,
        child: text,
      ),
    );
  }
}
