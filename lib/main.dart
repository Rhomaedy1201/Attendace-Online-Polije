import 'package:attendace_online_polije/core/config/app_router.dart';
import 'package:attendace_online_polije/core/config/export/index.dart';
import 'package:attendace_online_polije/core/constants/color_constants.dart';
import 'package:attendace_online_polije/features/auth/cubit/password_visibility_cubit.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null).then((_) {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavigatorCubit()),
          BlocProvider(create: (context) => PasswordVisibilityCubit()),
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          color: ColorConstants.primaryC,
        ),
      ),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
