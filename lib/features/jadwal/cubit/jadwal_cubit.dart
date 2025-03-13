import 'package:attendace_online_polije/features/jadwal/models/jadwal_model.dart';
import 'package:attendace_online_polije/features/jadwal/repository/jadwal_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'jadwal_state.dart';

class JadwalCubit extends Cubit<JadwalState> {
  JadwalRepository jadwalRepository;
  JadwalCubit(this.jadwalRepository) : super(JadwalInitial());

  void getJadwalAll() async {
    emit(JadwalLoading());
    try {
      final response = await jadwalRepository.getJadwalToday();
      emit(JadwalSuccess(jadwalAll: response));
    } catch (e) {
      emit(JadwalError(msgErr: "Error $e"));
    }
  }
}
