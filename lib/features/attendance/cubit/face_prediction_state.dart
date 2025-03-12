part of 'face_prediction_cubit.dart';

sealed class FacePredictionState {}

final class FacePredictionInitial extends FacePredictionState {}
final class FacePredictionLoading extends FacePredictionState {}

final class FacePredictionSuccess extends FacePredictionState {
  final Map<String, dynamic> data;
  FacePredictionSuccess({ required this.data});
}

final class FacePredictionError extends FacePredictionState {
  final String msgErr;
  FacePredictionError({ required this.msgErr});
}


