import 'dart:convert';

import 'package:attendace_online_polije/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {

  Future<Map<dynamic, dynamic>> login(String nim, String password) async {
    final body = {
      "nim": nim,
      "password": password,
    };

    final response = await http.post(
      Uri.parse(ApiConstants.loginEndpoint), 
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (data['status'] == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("nim", data['data']['user']["nim"]);
        await prefs.setString("token", data['data']["token"]);

        return data;
      }else{
        throw Exception("Login gagal: ${data["message"]}");
      }
    } else {
      throw Exception("Error: ${data['message']}");
    }
  }
}