// ignore_for_file: use_build_context_synchronously

import 'package:encode_decode_app/core/json_storage.dart';
import 'package:encode_decode_app/core/widgets/custom_text_box.dart';
import 'package:encode_decode_app/feature/encode/presentation/pages/cipher_selection_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;
  bool isLoginOption = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final JsonStorage _jsonDatabase = JsonStorage();

  void _login() async {
    final email = _usernameController.text;
    final password = _passwordController.text;

    try {
      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid email or password')));
        return;
      }

      final users = await _jsonDatabase.loadUsers();

      final user = users.firstWhere((user) =>
          (user['email'].toString() == email ||
              user['username'].toString() == email) &&
          user['password'].toString() == password);

      if (user.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CipherSelectionPage(),
          ),
        );
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Login Successful')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid email or password')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error loading users: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // Top container
          Expanded(
            child: Container(
              constraints: const BoxConstraints(minHeight: 100),
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                'LOGIN',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          // Bottom container
          Expanded(
            flex: 4,
            child: Stack(
              clipBehavior: Clip.none, // Allows the image to overflow
              children: [
                Container(
                  constraints: const BoxConstraints(maxHeight: 645),
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Color.fromARGB(255, 17, 42, 47),
                  ),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 120), // Space for image overlap
                      CustomTextBox(
                        prefixIcon: const Icon(Icons.person),
                        label: 'Email Address',
                        controller: _usernameController,
                      ),
                      CustomTextBox(
                        prefixIcon: const Icon(Icons.lock),
                        label: 'Password',
                        isPassword: true,
                        obscureText: true,
                        controller: _passwordController,
                      ),
                      const SizedBox(height: 10),
                      _buildLoginButton(),
                    ],
                  ),
                ),
                // Image overlapping top container
                const Positioned(
                  top: -130, // Adjust this for how much it overlaps
                  left: 0,
                  right: 0,
                  child: IgnorePointer(
                    child: Image(
                      image: AssetImage('assets/login_vector.png'),
                      alignment: Alignment.center,
                      height: 350, // Adjust the height as needed
                    ),
                  ),
                ),
              ],
            ),
          ),
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
        onPressed: _login,
        child: const Text('LOGIN'),
      ),
    );
  }
}
