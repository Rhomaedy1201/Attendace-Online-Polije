import 'package:attendace_online_polije/features/home/models/jadwal_today.dart';
import 'package:attendace_online_polije/features/home/repository/home_jadwal_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'jadwal_today_state.dart';

class JadwalTodayCubit extends Cubit<JadwalTodayState> {
  HomeJadwalRepository homeJadwalRepository;
  JadwalTodayCubit(this.homeJadwalRepository) : super(JadwalTodayInitial());

  void getJadwalToday() async {
    emit(JadwalTodayLoading());
    try {
      final data = await homeJadwalRepository.getJadwalToday();
      emit(JadwalTodaySuccess(jadwal: data));
    } catch (e) {
      emit(JadwalTodayError(message: "Error $e"));
    }
  }
}
