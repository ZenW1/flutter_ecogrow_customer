part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

class ProfileLoadSuccess extends ProfileState {
  final UserModel data;
  final String message ;

  ProfileLoadSuccess(this.data,this.message);

  @override
  List<Object> get props => [data];
}

class ProfileFailure extends ProfileState {
  final String message;

  ProfileFailure(this.message);

  @override
  List<Object> get props => [message];
}
