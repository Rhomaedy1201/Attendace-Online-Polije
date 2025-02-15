import 'dart:convert';

import 'package:attendace_online_polije/core/constants/api_constants.dart';
import 'package:attendace_online_polije/features/profile/models/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileRepository {
  Future<ProfileM> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    print(token);

    final response = await http.get(
      Uri.parse(ApiConstants.userEndpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      }
    );
    final jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return ProfileM.fromJson(jsonData);
    } else {
      throw Exception('Failed to load Profile ${response.statusCode}');
    }
  }
}