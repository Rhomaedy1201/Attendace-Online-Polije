part of 'jadwal_cubit.dart';

sealed class JadwalState {}

final class JadwalInitial extends JadwalState {}
final class JadwalLoading extends JadwalState {}
final class JadwalSuccess extends JadwalState {
  final JadwalAll jadwalAll;
  JadwalSuccess({required this.jadwalAll});
}

final class JadwalError extends JadwalState {
  final String msgErr;
  JadwalError({required this.msgErr});
}

