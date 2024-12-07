import 'package:encode_decode_app/feature/login/presentation/pages/login_page.dart';
import 'package:encode_decode_app/feature/login/presentation/providers/login_provider.dart';
import 'package:encode_decode_app/feature/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
      ],
      child: const MaterialApp(
        home: Scaffold(
          body: MainPage(),
        ),
      ),
    );
  }
}
