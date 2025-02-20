import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../export/index.dart';

class JadwalNowRepository {
  Future<Map<dynamic, dynamic>> getJadwalNow() async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    log("message");

    final response = await http.get(
      Uri.parse(ApiConstants.jadwalNowEndpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      }
    );

    final jsonData = jsonDecode(response.body);
    log(response.body);
    if (response.statusCode == 200) {
      return Map<dynamic, dynamic>.from(jsonData);
    } else {
      throw Exception('Failed to load jadwal today ${response.statusCode}');
    }
  }
}