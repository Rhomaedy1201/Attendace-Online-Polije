import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_auth_state.dart';

class LoginAuthCubit extends Cubit<LoginAuthState> {
  LoginAuthCubit() : super(LoginAuthInitial());
}
