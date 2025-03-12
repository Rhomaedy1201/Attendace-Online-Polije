import 'dart:convert';

import 'package:attendace_online_polije/core/constants/api_constants.dart';
import 'package:attendace_online_polije/features/history/model/history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HistoryRepository {
  Future<HistoryModel> getHistory(String tgl) async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      Uri.parse("${ApiConstants.historyEndpoint}?tanggal=$tgl"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return HistoryModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load History ${response.statusCode}');
    }
  }
}