part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AppStartedEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class AuthenticatingEvent extends AuthenticationEvent {
  final String accessToken;

  AuthenticatingEvent({required this.accessToken});

  @override
  List<Object> get props => [accessToken];
}
//
// class UnAuthenticateEvent extends AuthenticationEvent {
//   @override
//   List<Object> get props => [];
// }
