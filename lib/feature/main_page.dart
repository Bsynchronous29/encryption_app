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
    return Container(
      color: Colors.lightBlue[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTopCard(),
          _buildLoginSignUp(),
        ],
      ),
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
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100),
                child: const Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'ENCODEMATE',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 45,
                            ),
                          ),
                          Text(
                            'YOUR KEY TO SECURED TEXT',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IgnorePointer(
                        child: Image(
                          image: AssetImage('assets/computer_guy.png'),
                          height: 300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Positioned(
              //   top: 80, // Adjust this for how much it overlaps
              //   left: 0,
              //   right: 0,
              //   child: IgnorePointer(
              //     child: Image(
              //       image: AssetImage('assets/computer_guy.png'),
              //       height: 300,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildLoginSignUp() {
    double temp = -400;
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 250,
                  height: 45,
                  child: OutlinedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
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
                  width: 250,
                  height: 45,
                  child: OutlinedButton(
                    style: const ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 36, 82, 92),
                      ),
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
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
          SizedBox(
            height: 100,
            child: Stack(
              children: List.generate(20, (index) {
                temp += 210;
                return Positioned(
                  bottom: -100, // Position relative to the bottom
                  left: temp, // Adjust horizontal position
                  child: Image(
                    image: AssetImage('assets/clouds.png'),
                    width: 400, // Adjust size
                  ),
                );
              }),

              // [
              //   // First cloud
              //   Positioned(
              //     bottom: -100, // Position relative to the bottom
              //     left: -200, // Adjust horizontal position
              //     child: Image(
              //       image: AssetImage('assets/clouds.png'),
              //       width: 400, // Adjust size
              //     ),
              //   ),
              //   // Second cloud
              //   Positioned(
              //     bottom: -100, // Position relative to the bottom
              //     left: 60, // Adjust horizontal position
              //     child: Image(
              //       image: AssetImage('assets/clouds.png'),
              //       width: 400, // Adjust size
              //     ),
              //   ),
              // ],
            ),
          ),
        ],
      ),
    );
  }
}
