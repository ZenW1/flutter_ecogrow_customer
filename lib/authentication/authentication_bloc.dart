import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_token.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this._appToken) : super(AuthenticationInitial()) {
    on<AuthenticationEvent>(onAuthenticate);
    on<AuthenticatingEvent>(onAuthenticating);
  }

  final AppToken _appToken;

  Future<void> onAuthenticate(
      AuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    emit(AppStarted());
    try {
      final hasToken = await _appToken.hasToken();
      if (hasToken) {
        emit(Authenticated());
      } else if (!hasToken) {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(AuthenticateFailed(errorMessage: e.toString()));
    }
  }

  // check when authenticating with otp
  Future<void> onAuthenticating(
      AuthenticatingEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationInitial());
    try {
      await _appToken.saveAccessToken(event.accessToken);
      emit(Authenticated());
    } catch (e) {
      emit(AuthenticateFailed(errorMessage: e.toString()));
    }
  }
}
