import 'package:encode_decode_app/core/json_storage.dart';
import 'package:encode_decode_app/core/widgets/custom_text_box.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isLoginOption = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final JsonStorage _jsonDatabase = JsonStorage();

  void _signup() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      final userData = {'email': email, 'password': password};

      // Save to JSON database
      try {
        await _jsonDatabase.saveUser(userData);

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Signup Successful')));
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error saving user: $e')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Fill all fields')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Create an Acount',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Color.fromARGB(255, 17, 42, 47),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Center(
                      child: Text(
                        '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                  ),
                  CustomTextBox(
                    prefixIcon: const Icon(Icons.person),
                    label: 'Username',
                    controller: _usernameController,
                  ),
                  CustomTextBox(
                    prefixIcon: const Icon(Icons.person),
                    label: 'Email Address',
                    controller: _emailController,
                  ),
                  CustomTextBox(
                    prefixIcon: const Icon(Icons.lock),
                    label: 'Password',
                    obscureText: true,
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 10),
                  _buildLoginButton(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _buildLoginButton() {
    return Container(
      height: 45,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          backgroundColor: const WidgetStatePropertyAll(Colors.white),
          foregroundColor:
              const WidgetStatePropertyAll(Color.fromARGB(255, 17, 42, 47)),
        ),
        onPressed: _signup,
        child: const Text('SIGN UP'),
      ),
    );
  }
}
