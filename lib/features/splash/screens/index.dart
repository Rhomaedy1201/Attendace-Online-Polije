import 'package:attendace_online_polije/core/widgets/my_text.dart';
import 'package:attendace_online_polije/features/splash/cubit/check_auth_splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckAuthSplashCubit, CheckAuthSplashState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          Navigator.pushReplacementNamed(context, '/home');
        }else if(state is AuthUnauthenticated){
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
      child: Scaffold(
        body: Center(
          child: SizedBox(
              width: 220, child: Image.asset('assets/icons/icon_polije.png')),
        ),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyText(
              title:
                  "Copyright @ 2025 Attendace Online\nPoliteknik Negeri Jember",
              fontSize: 14,
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}
