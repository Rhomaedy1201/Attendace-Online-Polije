import 'package:attendace_online_polije/features/attendance/screens/index.dart';
import 'package:attendace_online_polije/features/jadwal/cubit/visibility_dropdown_cubit.dart';

import './export/index.dart';

class AppRoutes {
  // Route Name
  static const String splash = '/';
  static const String login = '/login';
  static const String myNavigationBar = '/my_navigation_bar';
  static const String home = '/home';
  static const String attendance = '/attendance';

  // Rute yang disediakan
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => CheckAuthSplashCubit()..checkAuthSplashentication(),
            child: SplashScreen(),
          ),
        );
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case myNavigationBar:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => NavigatorCubit()),
                BlocProvider(create: (context) => VisibilityDropdownCubit()),
              ], 
              child: MyNavigationBar(),
            )
          );
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case attendance:
        return MaterialPageRoute(builder: (_) => AttendanceScreen());
      // return MaterialPageRoute(builder: (_) => MultiBlocProvider(
      //     providers: [
      //       BlocProvider(create: (context) => ProductCubit(ProductRepository())..getProduct()),
      //       BlocProvider(create: (context) => CategoryProductCubit(CategoryRepository())..getCategories()),
      //     ],
      //     child: HomePage(),
      //   ),
      // );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Halaman tidak ditemukan')),
          ),
        );
    }
  }
}
