part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

class ProfileLoadSuccess extends ProfileState {
  final UserModel data;

  ProfileLoadSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class ProfileFailure extends ProfileState {
  final String message;

  ProfileFailure(this.message);

  @override
  List<Object> get props => [message];
}
