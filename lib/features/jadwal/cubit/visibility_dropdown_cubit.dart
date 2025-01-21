
import 'package:flutter_bloc/flutter_bloc.dart';

class VisibilityDropdownCubit extends Cubit<String> {
  VisibilityDropdownCubit() : super("1");

  void toggleVisibility(String value) {
    emit(value);
    print(value);
  }
}