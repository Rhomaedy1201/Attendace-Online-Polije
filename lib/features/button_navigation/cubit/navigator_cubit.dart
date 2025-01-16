import 'package:flutter_bloc/flutter_bloc.dart';

class NavigatorCubit extends Cubit<int> {
  NavigatorCubit() : super(0);

  void selectedNavigator(index){
    emit(index);
  }
}
