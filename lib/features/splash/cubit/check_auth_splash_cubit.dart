// ignore_for_file: dead_code

import 'package:flutter_bloc/flutter_bloc.dart';
part 'check_auth_splash_state.dart';

class CheckAuthSplashCubit extends Cubit<CheckAuthSplashState> {
  CheckAuthSplashCubit() : super(CheckAuthSplashInitial());

  Future<void> checkAuthSplashentication() async {
    await Future.delayed(Duration(seconds: 3));
    
    var isLoggedIn = false;
    if (isLoggedIn) {
      emit(AuthAuthenticated());
    } else {
      emit(AuthUnauthenticated());
    }
  }
}

