part of 'jadwal_today_cubit.dart';

sealed class JadwalTodayState {}

final class JadwalTodayInitial extends JadwalTodayState {}
final class JadwalTodayLoading extends JadwalTodayInitial {}

final class JadwalTodaySuccess extends JadwalTodayInitial {
  final JadwalToday jadwal;
  JadwalTodaySuccess({required this.jadwal});
}

final class JadwalTodayError extends JadwalTodayInitial {
  final String message;
  JadwalTodayError({required this.message});
}
