import 'package:attendace_online_polije/core/config/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/check_auth_splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckAuthSplashCubit()..checkAuthSplashentication(),
      child: BlocListener<CheckAuthSplashCubit, CheckAuthSplashState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Navigator.pushReplacementNamed(context, AppRoutes.myNavigationBar);
          } else if (state is AuthUnauthenticated) {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          }
        },
        child: Scaffold(
          body: Center(
            child: SizedBox(
              width: 220,
              child: Image.asset('assets/icons/icon_polije.png'),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Text(
              "Copyright @ 2025 Attendance Online\nPoliteknik Negeri Jember",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
