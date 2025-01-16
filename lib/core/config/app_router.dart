import 'package:attendace_online_polije/features/auth/screens/index.dart';
import 'package:attendace_online_polije/features/button_navigation/screens/index.dart';
import 'package:attendace_online_polije/features/home/screens/index.dart';
import 'package:attendace_online_polije/features/splash/cubit/check_auth_splash_cubit.dart';
import 'package:attendace_online_polije/features/splash/screens/index.dart';

import './export/index.dart';

class AppRoutes {
  // Route Name
  static const String splash = '/';
  static const String login = '/login';
  static const String myNavigationBar = '/my_navigation_bar';
  static const String home = '/home';

  // Rute yang disediakan
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
            create: (_) => CheckAuthSplashCubit()..checkAuthSplashentication(),
            child: SplashScreen(),
          ),
        );
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case myNavigationBar:
        return MaterialPageRoute(builder: (_) => MyNavigationBar());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
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