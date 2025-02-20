import 'package:attendace_online_polije/features/home/repository/jadwal_now_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'jadwal_now_state.dart';

class JadwalNowCubit extends Cubit<JadwalNowState> {
  JadwalNowRepository jadwalNowRepository;
  JadwalNowCubit(this.jadwalNowRepository) : super(JadwalNowInitial());

  void getJadwalNow() async {
    emit(JadwalNowLoading());
    try {
      final data = await jadwalNowRepository.getJadwalNow();
      emit(JadwalNowSuccess(jadwal: data));
    } catch (e) {
      emit(JadwalNowError(message: "Error $e"));
    }
  }
}
