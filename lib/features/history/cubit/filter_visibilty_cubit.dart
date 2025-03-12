import 'package:flutter_bloc/flutter_bloc.dart';

class FilterVisibiltyCubit extends Cubit<DateTime> {
  FilterVisibiltyCubit() : super(DateTime.now());

  void setDateTime(DateTime newDate) {
    emit(newDate);
  }
}