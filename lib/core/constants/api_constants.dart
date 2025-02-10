
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String baseUrl = "${dotenv.env['HOST']}";
  static const String loginEndpoint = '/login-mahasiswa';
  static const String logoutEndpoint = '/logout';
//   static const String registerEndpoint = '/auth/register';
//   static const String attendanceEndpoint = '/attendance';
}
