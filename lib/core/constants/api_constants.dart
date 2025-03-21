
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String? baseUrl = dotenv.env['HOST'];
  static String? apiPredict = dotenv.env['HOST_API_PYTHON'];
  static String loginEndpoint = '$baseUrl/login-mahasiswa';
  static String logoutEndpoint = '$baseUrl/logout';
  static String jadwalEndpoint = '$baseUrl/jadwal';
  static String jadwalTodayEndpoint = '$baseUrl/jadwal-all-day';
  static String jadwalNowEndpoint = '$baseUrl/jadwal-now';
  static String jadwalAllEndpoint = '$baseUrl/jadwal';
  static String userEndpoint = '$baseUrl/profile';
  static String attendanceEndpoint = '$baseUrl/absen-masuk';
  static String historyEndpoint = '$baseUrl/history';
}
