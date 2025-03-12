part of 'history_cubit.dart';

sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}
final class HistoryLoading extends HistoryState {}
final class HistorySuccess extends HistoryState {
  final HistoryModel history;
  HistorySuccess({required this.history});
}

final class HistoryError extends HistoryState {
  final String msgErr;
  HistoryError({required this.msgErr});
}


