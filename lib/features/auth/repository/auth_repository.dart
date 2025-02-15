import 'dart:convert';

import 'package:attendace_online_polije/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {

  Future<Map<dynamic, dynamic>> login(String nim, String pass) async {
    try {
      final body = {'nim': nim,'password': pass};
      final response = await http.post(
        Uri.parse(ApiConstants.loginEndpoint),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        }
      );

      final jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('nim', jsonData['data']['user']['nim']);
        await prefs.setString('token', jsonData['data']['token']);
        return Map<dynamic, dynamic>.from(jsonData);
      } else {
        throw Exception('Error ${jsonData['message']} ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<void> removePrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('nim');
    await prefs.remove('token');
  }

  Future<Map<dynamic, dynamic>> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await http.post(
        Uri.parse(ApiConstants.logoutEndpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }
      );
      
      final jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        removePrefs();
        return Map<dynamic, dynamic>.from(jsonData);
      } else {
        throw Exception('Error ${jsonData['message']} ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }
}