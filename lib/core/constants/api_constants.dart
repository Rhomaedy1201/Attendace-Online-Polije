
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String? baseUrl = dotenv.env['HOST'];
  static String loginEndpoint = '$baseUrl/login-mahasiswa';
  static String logoutEndpoint = '$baseUrl/logout';
  static String jadwalEndpoint = '$baseUrl/jadwal';
  static String jadwalTodayEndpoint = '$baseUrl/jadwal-all-day';
  static String jadwalNowEndpoint = '$baseUrl/jadwal-now';
  static String userEndpoint = '$baseUrl/profile';
//   static  String registerEndpoint = '/auth/register';
//   static  String attendanceEndpoint = '/attendance';
}
