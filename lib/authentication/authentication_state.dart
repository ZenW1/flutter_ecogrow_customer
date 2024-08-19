part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class Authenticating extends AuthenticationState {
  const Authenticating();

  @override
  List<Object> get props => [];
}

class Authenticated extends AuthenticationState {

  Authenticated();

  @override
  List<Object> get props => [];
}

class UnAuthenticated extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticateFailed extends AuthenticationState {
  final String errorMessage;

  AuthenticateFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
