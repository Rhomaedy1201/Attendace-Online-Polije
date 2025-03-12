part of 'attendance_cubit.dart';

sealed class AttendanceState {}

final class AttendanceInitial extends AttendanceState {}
final class AttendanceLoading extends AttendanceState {}
final class AttendanceSuccess extends AttendanceState {
  final String msg;
  AttendanceSuccess({required this.msg});
}

final class AttendanceError extends AttendanceState {
  final String msgErr;
  AttendanceError({required this.msgErr});
}

