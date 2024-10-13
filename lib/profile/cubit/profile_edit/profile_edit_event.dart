part of 'profile_edit_bloc.dart';

sealed class ProfileEditEvent extends Equatable {
  const ProfileEditEvent();
}

class ProfileOnEditEvent extends ProfileEditEvent {
  const ProfileOnEditEvent({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dob,
    required this.uid,
    required this.phoneNumber,
    required this.image,
  });

  final String firstName;
  final String lastName;
  final String gender;
  final String dob;
  final int uid;
  final String phoneNumber;
  final String image;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        gender,
        dob,
        uid,
        phoneNumber,
        image,
      ];
}

class ProfileEditUploadImageEvent extends ProfileEditEvent {
  const ProfileEditUploadImageEvent(this.source);

  final ImageSource source;

  @override
  List<Object?> get props => [source];
}
