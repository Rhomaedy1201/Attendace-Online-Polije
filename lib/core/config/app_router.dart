import 'package:attendace_online_polije/features/attendance/screens/detail.dart';

import './export/index.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String myNavigationBar = '/my_navigation_bar';
  static const String home = '/home';
  static const String attendance = '/attendance';
  static const String detailAttendance = '/detail_attendance';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => BlocProvider(create: (context) => CheckAuthSplashCubit()..checkAuthSplashentication(), 
          child: SplashScreen(),
        ));
      case login:
        return MaterialPageRoute(builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthCubit(AuthRepository())),
            BlocProvider(create: (context) => PasswordVisibilityCubit()),
          ], 
          child: LoginScreen(),
        ));
      case myNavigationBar:
        return MaterialPageRoute(builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => NavigatorCubit()),
            BlocProvider(create: (context) => JadwalTodayCubit(HomeJadwalRepository())..getJadwalToday()),
            BlocProvider(create: (context) => ProfileCubit(ProfileRepository())..getProfile()),
            BlocProvider(create: (context) => AuthCubit(AuthRepository())),
          ], 
          child: MyNavigationBar()
        ));
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case attendance:
        return MaterialPageRoute(builder: (_) => AttendanceScreen());
      case detailAttendance:
        return MaterialPageRoute(builder: (_) => DetailAttendanceScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Halaman tidak ditemukan')),
          ),
        );
    }
  }
}
