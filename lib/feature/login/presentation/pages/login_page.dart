import 'package:encode_decode_app/core/json_storage.dart';
import 'package:encode_decode_app/core/widgets/custom_text_box.dart';
import 'package:encode_decode_app/feature/encode/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoginOption = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final JsonStorage _jsonDatabase = JsonStorage();

  void login() async {
    final email = _usernameController.text;
    final password = _passwordController.text;

    try {
      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Invalid email or password')));
        return;
      }

      final users = await _jsonDatabase.loadUsers();

      final user = users.firstWhere((user) =>
          user['email'].toString().contains(email) &&
          user['password'].toString().contains(password));

      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Login Successful')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Invalid email or password')));
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
          const Expanded(
            child: Center(
              child: Text(
                'LOGIN',
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
                    label: 'Email Address',
                    controller: _usernameController,
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
        onPressed: () {
          login();
        },
        child: const Text('LOGIN'),
      ),
    );
  }
}
