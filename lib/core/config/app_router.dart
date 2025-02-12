import 'package:attendace_online_polije/features/attendance/screens/index.dart';
import './export/index.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String myNavigationBar = '/my_navigation_bar';
  static const String home = '/home';
  static const String attendance = '/attendance';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case myNavigationBar:
        return MaterialPageRoute(builder: (_) => MyNavigationBar());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case attendance:
        return MaterialPageRoute(builder: (_) => AttendanceScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Halaman tidak ditemukan')),
          ),
        );
    }
  }
}
