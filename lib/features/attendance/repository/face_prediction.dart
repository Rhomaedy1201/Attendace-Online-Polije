import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:attendace_online_polije/core/constants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FacePredictionRepository {
  Future<Map<String, dynamic>> facePredic(File imgFile) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final nim = prefs.getString('nim');

      debugPrint("NIM : $nim");

      var request = http.MultipartRequest("POST", Uri.parse("${ApiConstants.apiPredict}/predict"));
      request.files.add(await http.MultipartFile.fromPath('file', imgFile.path));
      request.fields['nim_asli'] = nim!;

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      log("Response API: $responseBody");

      if (response.statusCode == 200) {
        return jsonDecode(responseBody);
      } else {
        final errorData = jsonDecode(responseBody);
        throw Exception("Error: ${errorData['message']} (${response.statusCode})");
      }
    } catch (e) {
      throw Exception('$e');
    }
  }
}