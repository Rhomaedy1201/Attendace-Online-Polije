import 'package:attendace_online_polije/features/attendance/screens/index.dart';
import 'package:attendace_online_polije/features/auth/cubit/auth_cubit.dart';
import 'package:attendace_online_polije/features/auth/repository/auth_repository.dart';
import 'package:attendace_online_polije/features/home/cubit/jadwal_today_cubit.dart';
import 'package:attendace_online_polije/features/home/repository/home_jadwal_repository.dart';
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
        return MaterialPageRoute(builder: (_) => BlocProvider(create: (context) => AuthCubit(AuthRepository()), child: LoginScreen()));
      case myNavigationBar:
        return MaterialPageRoute(builder: (_) => MyNavigationBar());
      case home:
        return MaterialPageRoute(builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => JadwalTodayCubit(HomeJadwalRepository())..getJadwalToday()),
          ], 
          child: HomeScreen()
        ));
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
