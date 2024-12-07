import 'package:encode_decode_app/core/widgets/custom_text_box.dart';
import 'package:encode_decode_app/feature/login/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({
    super.key,
  });

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: const Center(
              child: Text(
                'Sign up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          CustomTextBox(
            label: 'Username',
            controller: _usernameController,
          ),
          CustomTextBox(
            label: 'Password',
            obscureText: true,
            controller: _passwordController,
          ),
          CustomTextBox(
            label: 'Password',
            obscureText: true,
            controller: _passwordConfirmationController,
          ),
          const SizedBox(height: 10),
          _buildLoginButton(),
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
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: const WidgetStatePropertyAll(Colors.blue),
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
        ),
        onPressed: () {
          if (_passwordConfirmationController.text !=
              _passwordController.text) {
            return;
          }
          UserEntity user = UserEntity(
            username: _usernameController.text,
            password: _passwordController.text,
          );
        },
        child: const Text('Login'),
      ),
    );
  }
}
