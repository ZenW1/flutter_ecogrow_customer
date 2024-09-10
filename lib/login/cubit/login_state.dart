part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  submitting,
  success,
  failure,
  sendOtp,
  verifyOtp,
  loginOut,
  isNewUser,
  loading,
}

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    this.phoneNumber = '',
    this.isPhoneNumberValid = false,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isNewUser = true,
    this.errorMessage = '',
    this.accessToken = '',
  });

  LoginState copyWith({
    LoginStatus? status,
    String? phoneNumber,
    bool? isPhoneNumberValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isNewUser,
    String? errorMessage,
    String? accessToken,
  }) {
    return LoginState(
      status: status ?? this.status,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isPhoneNumberValid: isPhoneNumberValid ?? this.isPhoneNumberValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isNewUser: isNewUser ?? this.isNewUser,
      errorMessage: errorMessage ?? this.errorMessage,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  factory LoginState.initial() {
    return LoginState();
  }

  final LoginStatus status;
  final String phoneNumber;
  final String accessToken;
  final bool isPhoneNumberValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isNewUser;
  final String errorMessage;

  @override
  List<Object> get props => [
        status,
        phoneNumber,
        isPhoneNumberValid,
        isSubmitting,
        isSuccess,
        errorMessage,
        isNewUser,
        accessToken,
      ];
}
