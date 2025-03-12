
import 'package:attendace_online_polije/core/utils/date_formatter.dart';
import 'package:attendace_online_polije/features/history/model/history_model.dart';
import 'package:attendace_online_polije/features/history/repository/history_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryRepository historyRepository;
  HistoryCubit(this.historyRepository) : super(HistoryInitial());

  void getHistory(DateTime tgl) async {
    emit(HistoryLoading());
    try {
      final response = await historyRepository.getHistory("${tgl.getYear()}-${tgl.getMonthNumber()}");
      emit(HistorySuccess(history: response));
    } catch (e) {
      emit(HistoryError(msgErr: "Error $e"));
    }
  }
}
