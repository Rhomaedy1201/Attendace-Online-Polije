part of 'check_auth_splash_cubit.dart';

sealed class CheckAuthSplashState {}

final class CheckAuthSplashInitial extends CheckAuthSplashState {}
final class AuthAuthenticated extends CheckAuthSplashInitial {}
final class AuthUnauthenticated extends CheckAuthSplashInitial {}
