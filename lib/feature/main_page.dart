import 'package:encode_decode_app/feature/login/presentation/pages/login_page.dart';
import 'package:encode_decode_app/feature/login/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTopCard(),
        _buildLoginSignUp(),
      ],
    );
  }

  Expanded _buildTopCard() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: Color.fromARGB(255, 17, 42, 47),
        ),
        child: const Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ENCODEMATE',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
            Text(
              'YOUR KEY TO SECURED TEXT',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        )),
      ),
    );
  }

  Expanded _buildLoginSignUp() {
    return Expanded(
        child: Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 180),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: 150,
              height: 45,
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(
                    Color.fromARGB(255, 36, 82, 92),
                  ),
                  foregroundColor: WidgetStatePropertyAll(
                    Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: const Text('LOGIN'),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: 150,
              height: 45,
              child: OutlinedButton(
                style: ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(
                  Color.fromARGB(255, 36, 82, 92),
                )),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpPage(),
                    ),
                  );
                },
                child: const Text('SIGNUP'),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
