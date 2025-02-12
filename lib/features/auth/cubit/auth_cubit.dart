import 'package:attendace_online_polije/features/auth/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepository authRepository;
  AuthCubit(this.authRepository) : super(AuthInitial());

  void login({required String nim, required String pass}) async{
    emit(AuthLoading());
    try {
      final response = await authRepository.login(nim, pass);
      emit(AuthSuccess(msg: response['message']));
    } catch (e) {
      emit(AuthError(msgErr: "error occurred: $e"));
    }
  }
}
