import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_auth_state.dart';

class LoginAuthCubit extends Cubit<LoginAuthState> {
  LoginAuthCubit() : super(LoginAuthInitial());
}
