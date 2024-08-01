part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  submitting,
  success,
  failure,
  sendOtp,
  verifyOtp,
  loading,
}

abstract class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    this.phoneNumber = '',
    this.isPhoneNumberValid = false,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage = '',
  });

  final LoginStatus status;
  final String phoneNumber;
  final bool isPhoneNumberValid;
  final bool isSubmitting;
  final bool isSuccess;
  final String errorMessage;

  @override
  List<Object> get props => [
        status,
        phoneNumber,
        isPhoneNumberValid,
        isSubmitting,
        isSuccess,
        errorMessage,
      ];
}

class LoginInitial extends LoginState {
  const LoginInitial() : super(status: LoginStatus.initial);
}

class LoginLoading extends LoginState {
  const LoginLoading() : super(status: LoginStatus.loading);
}

class LoginSubmitting extends LoginState {
  const LoginSubmitting(String phoneNumber)
      : super(
          status: LoginStatus.submitting,
          phoneNumber: phoneNumber,
        );
}

class LoginSendingOtp extends LoginState {
  const LoginSendingOtp(String phoneNumber)
      : super(
          status: LoginStatus.sendOtp,
          phoneNumber: phoneNumber,
        );
}

class LoginVerifyOtp extends LoginState {
  const LoginVerifyOtp({required this.isNewUser})
      : super(
          status: LoginStatus.verifyOtp,
        );
  final bool isNewUser;
}

class LoginFailure extends LoginState {
  const LoginFailure(String errorMessage)
      : super(
          status: LoginStatus.failure,
          errorMessage: errorMessage,
        );
}
