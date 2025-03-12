import 'dart:convert';

import 'package:attendace_online_polije/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AttendanceRepository {
  Future<Map<String, dynamic>> postAttendance() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final nim = prefs.getString('nim');

      final body = {'nim': nim};
      final response = await http.post(
        Uri.parse(ApiConstants.attendanceEndpoint),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }
      );

      final jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return Map<String, dynamic>.from(jsonData);
      } else {
        throw Exception('Error ${jsonData['message']} ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }
}