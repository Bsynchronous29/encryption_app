import 'package:encode_decode_app/core/json_storage.dart';
import 'package:encode_decode_app/feature/login/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  UserEntity? user;

  // void login(BuildContext context, {required UserEntity user}) async {
  //   final JsonStorage _jsonStorage = JsonStorage();
  //   final username = user.username;
  //   final password = user.password;

  //   final userData = await _jsonStorage.loadUsers();
  //   if (userData != null &&
  //       userData['email'] == username &&
  //       userData['password'] == password) {
  //     // Successful Login
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('Login Successful')));
  //   } else {
  //     // Failed Login
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('Invalid email or password')));
  //   }
  // }
}
