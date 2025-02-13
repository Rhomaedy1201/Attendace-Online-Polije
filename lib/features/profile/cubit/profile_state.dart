part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileLoading extends ProfileInitial {}
final class ProfileSuccess extends ProfileInitial {
  final ProfileM data;
  ProfileSuccess({required this.data});
}
final class ProfileError extends ProfileInitial {
  final String message;
  ProfileError({required this.message});
}

