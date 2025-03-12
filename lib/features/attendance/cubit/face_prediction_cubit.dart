import 'dart:io';
import 'package:attendace_online_polije/features/attendance/repository/face_prediction.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'face_prediction_state.dart';

class FacePredictionCubit extends Cubit<FacePredictionState> {
  FacePredictionRepository facePredictionRepository;
  FacePredictionCubit(this.facePredictionRepository) : super(FacePredictionInitial());

  void predict({required File imgFile}) async {
    emit(FacePredictionLoading());
    try {
      final response = await facePredictionRepository.facePredic(imgFile);
      if (response.containsKey("error")) {
        emit(FacePredictionError(msgErr: response["error"]));
      } else {
        emit(FacePredictionSuccess(data: response));
      }
    } catch (e) {
      emit(FacePredictionError(msgErr: "error predict : $e"));
    }
  }
}
