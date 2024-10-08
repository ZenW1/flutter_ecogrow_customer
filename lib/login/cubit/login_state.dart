part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  submitting,
  success,
  failure,
  sendOtp,
  verifyOtp,
  loginOut,
  isRegister,
  loading,
}

class LoginState extends Equatable {
  LoginState({
    this.status = LoginStatus.initial,
    this.phoneNumber = '',
    this.isPhoneNumberValid = false,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isRegister = false,
    this.errorMessage = '',
    this.accessToken = '',
    required this.userInfo,
  });

  LoginState copyWith({
    LoginStatus? status,
    String? phoneNumber,
    bool? isPhoneNumberValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isRegister,
    String? errorMessage,
    String? accessToken,
    UserInfoModel? userInfo,
  }) {
    return LoginState(
      status: status ?? this.status,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isPhoneNumberValid: isPhoneNumberValid ?? this.isPhoneNumberValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isRegister: isRegister ?? this.isRegister,
      errorMessage: errorMessage ?? this.errorMessage,
      accessToken: accessToken ?? this.accessToken,
      userInfo: userInfo ?? this.userInfo,
    );
  }

  // factory LoginState.initial() {
  //   return LoginState();
  // }

  final LoginStatus status;
  final String phoneNumber;
  final String accessToken;
  final bool isPhoneNumberValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isRegister;
  final String errorMessage;
  final UserInfoModel userInfo;

  @override
  List<Object> get props => [
        status,
        phoneNumber,
        isPhoneNumberValid,
        isSubmitting,
        isSuccess,
        errorMessage,
        isRegister,
        accessToken,
        userInfo,
      ];
}
