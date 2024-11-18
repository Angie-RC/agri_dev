import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'https://agripureapi.onrender.com';

  // Método para registro
  Future<bool> register(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );

    return response.statusCode == 201;
  }

  // Método para iniciar sesión
  Future<bool> login(String email, String password) async {
    final response = await http.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode == 200) {
      final users = jsonDecode(response.body);
      for (var user in users) {
        if (user['email'] == email && user['password'] == password) {
          return true;
        }
      }
    }

    return false;
  }
}
