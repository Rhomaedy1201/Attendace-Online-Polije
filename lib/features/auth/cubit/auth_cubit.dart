import 'package:attendace_online_polije/features/auth/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> login(String nim, String password) async{
    emit(AuthLoading());

    try {
      final response = await authRepository.login(nim, password);
      emit(AuthSuccess(nim: response['data']['user']["nim"]));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
