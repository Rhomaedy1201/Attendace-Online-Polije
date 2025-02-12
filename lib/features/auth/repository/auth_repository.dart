import 'dart:convert';

import 'package:attendace_online_polije/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class AuthRepository {

  Future<Map<dynamic, dynamic>> login(String nim, String pass) async {
    try {
      final body = {'nim': nim,'password': pass};
      final response = await http.post(
        Uri.parse("http://192.168.137.215:8000/api/login-mahasiswa"),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        }
      );

      final jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(jsonData);
        return Map<dynamic, dynamic>.from(jsonData);
      } else {
        throw Exception('Error ${jsonData['message']} ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }
}