part of 'profile_edit_bloc.dart';

sealed class ProfileEditEvent extends Equatable {
  const ProfileEditEvent();
}

class ProfileOnEditEvent extends ProfileEditEvent {
  const ProfileOnEditEvent(this.userData);

  final UserInfoModel userData;

  @override
  List<Object?> get props => [userData];
}

class ProfileEditUploadImageEvent extends ProfileEditEvent {
  const ProfileEditUploadImageEvent(this.source);

  final ImageSource source;

  @override
  List<Object?> get props => [source];
}
