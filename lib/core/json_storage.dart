import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class JsonStorage {
  static const String fileName = 'users.json';

  // Get the local file path
  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/$fileName';
    return File(path);
  }

  // Load JSON data from file
  Future<List<Map<String, dynamic>>> loadUsers() async {
    try {
      final file = await _getFile();

      if (await file.exists()) {
        final content = await file.readAsString();
        return List<Map<String, dynamic>>.from(json.decode(content));
      } else {
        return [];
      }
    } catch (e) {
      throw Exception("Error loading users: $e");
    }
  }

  // Save user data to the file
  Future<void> saveUser(Map<String, dynamic> user) async {
    final file = await _getFile();
    final users = await loadUsers();
    users.add(user);

    final jsonString = json.encode(users);
    await file.writeAsString(jsonString);
  }
}
