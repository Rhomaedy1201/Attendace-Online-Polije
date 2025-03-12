
import 'package:attendace_online_polije/features/attendance/repository/attendance_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceRepository attendanceRepository;
  AttendanceCubit(this.attendanceRepository) : super(AttendanceInitial());

  void attendance() async {
    emit(AttendanceLoading());
    try {
      final response = await attendanceRepository.postAttendance();
      if (response.containsKey("error")) {
        emit(AttendanceError(msgErr: response["error"]));
      } else {
        emit(AttendanceSuccess(msg: response['message']));
      }
    } catch (e) {
      emit(AttendanceError(msgErr: "error predict : $e"));
    }
  }
}
