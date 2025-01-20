
import 'package:flutter_bloc/flutter_bloc.dart';

class VisibilityDropdownCubit extends Cubit<String> {
  VisibilityDropdownCubit() : super("");

  void toggleVisibility(value){
    emit(value);
    print(value);
  } 
}
