import 'dart:convert';

import 'package:attendace_online_polije/core/config/export/index.dart';
import 'package:attendace_online_polije/features/jadwal/models/jadwal_model.dart';
import 'package:http/http.dart' as http;

class JadwalRepository {
  Future<JadwalAll> getJadwalToday() async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      Uri.parse(ApiConstants.jadwalAllEndpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      }
    );

    final jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return JadwalAll.fromJson(jsonData);
    } else {
      throw Exception('Failed to load jadwal all ${response.statusCode}');
    }
  }
}