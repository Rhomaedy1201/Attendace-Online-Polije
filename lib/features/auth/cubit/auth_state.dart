part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final String msg;
  AuthSuccess({required this.msg});
}

final class AuthError extends AuthState {
  final String msgErr;
  AuthError({required this.msgErr});
}

