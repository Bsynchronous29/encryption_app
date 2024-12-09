import 'package:encode_decode_app/feature/login/presentation/pages/login_page.dart';
import 'package:encode_decode_app/feature/login/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                margin: EdgeInsets.only(top: 100),
                child: Column(
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
                ),
              ),
              Positioned(
                top: 180, // Adjust this for how much it overlaps
                left: 0,
                right: 0,
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
      ),
    );
  }

  Expanded _buildLoginSignUp() {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 250,
                      height: 45,
                      child: OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor: const WidgetStatePropertyAll(
                            Color.fromARGB(255, 36, 82, 92),
                          ),
                          foregroundColor: const WidgetStatePropertyAll(
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
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.stretch,
        //       children: [
        //         Container(
        //           margin: const EdgeInsets.all(10),
        //           width: 150,
        //           height: 45,
        //           child: OutlinedButton(
        //             style: ButtonStyle(
        //               backgroundColor: const MaterialStatePropertyAll(
        //                 Color.fromARGB(255, 36, 82, 92),
        //               ),
        //               foregroundColor: const MaterialStatePropertyAll(
        //                 Colors.white,
        //               ),
        //             ),
        //             onPressed: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (context) => const LoginPage(),
        //                 ),
        //               );
        //             },
        //             child: const Text('LOGIN'),
        //           ),
        //         ),
        //         Container(
        //           margin: const EdgeInsets.all(10),
        //           width: 150,
        //           height: 45,
        //           child: OutlinedButton(
        //             style: ButtonStyle(
        //               foregroundColor: const MaterialStatePropertyAll(
        //                 Color.fromARGB(255, 36, 82, 92),
        //               ),
        //             ),
        //             onPressed: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (context) => const SignUpPage(),
        //                 ),
        //               );
        //             },
        //             child: const Text('SIGNUP'),
        //           ),
        //         ),
        //       ],
        //     ),
        //     Container(
        //       color: Colors.amber,
        //       height: 100,
        //       child: Stack(
        //         children: [
        //           // First cloud
        //           Positioned(
        //             bottom: 0, // Position relative to the bottom
        //             left: 0, // Adjust horizontal position
        //             child: const Image(
        //               image: AssetImage('assets/clouds.png'),
        //               width: 100, // Adjust size
        //             ),
        //           ),
        //           // Second cloud
        //           Positioned(
        //             bottom: 0, // Position relative to the bottom
        //             right: 0, // Adjust horizontal position
        //             child: const Image(
        //               image: AssetImage('assets/clouds.png'),
        //               width: 150, // Adjust size
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
