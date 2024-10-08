import 'package:dio/dio.dart';
import 'package:flutter_ecogrow_customer/data/service/login_service.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_token.dart';
enum RefreshMethod { GET, POST }

enum TokenType { NONE, BEARER, BASIC, FIREBASE }

class RefreshFirebaseToken<T> extends QueuedInterceptor {
  RefreshFirebaseToken( {
    required this.url,
    this.requestHeaders,
    this.appToken,
    required this.onRequestSuccess,
    this.method = RefreshMethod.POST,
    required this.responseTokenKey,
    this.tokenType = TokenType.BEARER,
    this.expiration = const Duration(minutes: 60),
  });

  final String url;
  final Duration expiration;
  final TokenType tokenType;
  final RefreshMethod method;
  final String responseTokenKey;
  final AppToken? appToken;
  final Map<String, dynamic>? requestHeaders;
  final void Function(T dynamic) onRequestSuccess;

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {

    final accessToken = await  appToken!.getAccessToken();
    try {
      // check if expiration is equal or less than 30 minutes
      if (expiration.inMinutes <= 60) {
        // refresh token

        await LoginService().signOut();

        final token = await LoginService().getAccessToken(forceReFresh: true);
        // check if refresh token is successful
        if (token != null || token.isNotEmpty) {
          // call onRequestSuccess callback
          onRequestSuccess(token as T);

          switch (tokenType) {
            case TokenType.BEARER:
              options.headers['Authorization'] = 'Bearer $token';
              break;
            case TokenType.BASIC:
              options.headers['Authorization'] = 'Basic $token';
              break;
            case TokenType.FIREBASE:
              options.headers['Authorization'] = token;
              break;
            case TokenType.NONE:
              options.headers['Authorization'] = token;
              break;
          }
          handler.next(options);
        }
      } else {
        // check token type
        switch (tokenType) {
          case TokenType.BEARER:
            options.headers['Authorization'] = 'Bearer $accessToken';
            break;
          case TokenType.BASIC:
            options.headers['Authorization'] = 'Basic $accessToken';
            break;
          case TokenType.NONE:
            options.headers['Authorization'] = accessToken;
            break;
          case TokenType.FIREBASE:
            options.headers['Authorization'] = accessToken;

            break;
        }

        handler.next(options);
      }
    } catch (e) {
      // continue request even if refresh token fails
      handler.next(options);
    }
  }
}
