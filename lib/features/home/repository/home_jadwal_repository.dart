import 'dart:convert';

import 'package:attendace_online_polije/core/constants/api_constants.dart';
import 'package:attendace_online_polije/features/home/models/jadwal_today.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeJadwalRepository {
  Future<JadwalToday> getJadwalToday() async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      Uri.parse(ApiConstants.jadwalTodayEndpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      }
    );

    final jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return JadwalToday.fromJson(jsonData);
    } else {
      throw Exception('Failed to load jadwal today ${response.statusCode}');
    }
  }
}