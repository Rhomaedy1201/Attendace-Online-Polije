import 'package:attendace_online_polije/features/profile/models/profile.dart';
import 'package:attendace_online_polije/features/profile/repository/profile_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileRepository profileRepository;
  ProfileCubit(this.profileRepository) : super(ProfileInitial());

  void getProfile() async {
    emit(ProfileLoading());
    try {
      final data = await profileRepository.getProfile();
      emit(ProfileSuccess(data: data));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }
}
