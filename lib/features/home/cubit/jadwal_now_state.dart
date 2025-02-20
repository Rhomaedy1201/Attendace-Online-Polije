part of 'jadwal_now_cubit.dart';

sealed class JadwalNowState {}

final class JadwalNowInitial extends JadwalNowState {}
final class JadwalNowLoading extends JadwalNowInitial {}

final class JadwalNowSuccess extends JadwalNowInitial {
  final Map<dynamic, dynamic> jadwal;
  JadwalNowSuccess({required this.jadwal});
}

final class JadwalNowError extends JadwalNowInitial {
  final String message;
  JadwalNowError({required this.message});
}

