part of 'profile_edit_bloc.dart';

sealed class ProfileEditState extends Equatable {
  const ProfileEditState();
}

final class ProfileEditInitial extends ProfileEditState {
  @override
  List<Object> get props => [];
}

class ProfileEditLoading extends ProfileEditState {
  @override
  List<Object> get props => [];
}

class ProfileEditLoadSuccess extends ProfileEditState {
  final UserInfoModel userData;
  final String message;

  ProfileEditLoadSuccess(this.userData, this.message);

  @override
  List<Object> get props => [userData, message];
}

class ProfileEditUploadImage extends ProfileEditState {
  final File image;
  final String base64Image;

  ProfileEditUploadImage(this.image, this.base64Image);

  @override
  List<Object> get props => [image, base64Image];
}

class ProfileEditFailure extends ProfileEditState {
  final String message;

  ProfileEditFailure(this.message);

  @override
  List<Object> get props => [message];
}
