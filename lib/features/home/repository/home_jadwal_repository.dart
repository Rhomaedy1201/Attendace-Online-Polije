import 'dart:convert';
import 'package:http/http.dart' as http;
import '../export/index.dart';

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