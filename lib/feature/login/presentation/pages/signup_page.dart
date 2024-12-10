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
    final username = _usernameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      final userData = {
        'email': email,
        'username': username,
        'password': password
      };

      // Save to JSON database
      try {
        final users = await _jsonDatabase.loadUsers();

        final user = users.where((user) => user['email'] == email).toList();

        if (user.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content:
                  Text('User is already existing. Please try another user.')));
          return;
        }

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
          Expanded(
            child: Container(
              constraints: const BoxConstraints(minHeight: 100),
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                'Create an Account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  constraints: const BoxConstraints(maxHeight: 585),
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
                    children: [
                      const SizedBox(height: 120),
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
                const Positioned(
                    top: -130,
                    left: 0,
                    right: 0,
                    child: IgnorePointer(
                      child: Image(
                        image: AssetImage('assets/signup_vector.png'),
                        alignment: Alignment.center,
                        height: 350, // Adjust the height as needed
                      ),
                    )),
              ],
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
