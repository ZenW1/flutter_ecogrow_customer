import 'dart:convert';

import 'package:dio/dio.dart' hide ProgressCallback;
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_token.dart';
import 'package:http_client/http_client.dart';
import 'package:http_client/src/interceptors/logger_interceptor.dart';
import 'package:http_client/src/interceptors/refresh_firebase_token.dart';

typedef ProgressCallback = void Function(int count, int total);

abstract class HttpClient {
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Object? body,
  });

  Future<Map<String, dynamic>> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  });

  Future<Map<String, dynamic>> patch(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Object? body,
  });

  Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<void> downloadFile(
    String path, {
    required String savePath,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    required ProgressCallback onReceiveProgress,
  });
}

class DioHttpClient implements HttpClient {
  DioHttpClient({
    required Dio dio,
    required String baseUrl,
    required AppToken appToken,
  })  : _dio = dio,
        _baseUrl = baseUrl,
        _appToken = appToken {
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers['Authorization'] = '${appToken.getAccessToken()}';
    _dio.options.baseUrl = _baseUrl;
    _dio.interceptors.add(LoggingInterceptor());
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    _dio.interceptors.add(
      RefreshFirebaseToken(
        appToken: appToken!,
        url: _baseUrl,
        tokenType: TokenType.FIREBASE,
        responseTokenKey: AppConstant.accessToken,
        onRequestSuccess: (dynamic) async {
          await appToken.saveAccessToken(dynamic! as String);
        },
      ),
    );
  }

  Future<String> getAccessToken() async {
    final token = await _appToken.getAccessToken();
    return token;
  }

  final Dio _dio;
  final String _baseUrl;
  final AppToken _appToken;

  // add for add more interceptor
  // final List<Interceptor>? _interceptors;

  @override
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return response.data!;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic body,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        path,
        queryParameters: queryParameters,
        data: body,
        options: Options(headers: headers),
      );

      if (response.data is Map<String, dynamic>) {
        return response.data as Map<String, dynamic>;
      } else {
        return jsonDecode(response.data as String) as Map<String, dynamic>;
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic body,
  }) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        path,
        queryParameters: queryParameters,
        data: body,
        options: Options(
          headers: headers,
        ),
      );
      return response.data!;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.delete<Map<String, dynamic>>(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return response.data!;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> patch(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic body,
  }) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        path,
        queryParameters: queryParameters,
        data: body,
        options: Options(
          headers: headers,
        ),
      );
      return response.data!;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // download file
  @override
  Future<void> downloadFile(
    String urlPath, {
    required String savePath,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    required ProgressCallback onReceiveProgress,
  }) async {
    try {
      await _dio.download(
        urlPath,
        savePath,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // _handleError method
  Exception _handleError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return RequestTimeoutException('Request Timeout');
    } else if (e.type == DioExceptionType.cancel) {
      return RequestCancelledException('Request Cancelled');
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return RequestTimeoutException('Receive Timeout');
    } else if (e.type == DioExceptionType.unknown) {
      final data = e.response?.data;
      switch (e.response!.statusCode) {
        case 400:
          return RequestFailedException(
            data['message'] as String? ?? 'Request Failed',
          );
        case 401:
          return RequestUnauthorizedException(
            data['message'] as String? ?? 'Request Unauthorized',
          );
        case 403:
          return RequestForbiddenException(
            data['message'] as String? ?? 'Request Forbidden',
          );
        case 404:
          return RequestNotFoundException(
            data['message'] as String? ?? 'Request Not Found',
          );
        case 405:
          return RequestMethodNotAllowedException(
            data['message'] as String? ?? 'Request Method Not Allowed',
          );
        default:
          return RequestFailedException(
            data['message'] as String? ?? 'Request Failed',
          );
      }
    } else {
      final data = e.response?.data;
      switch (e.response!.statusCode) {
        case 400:
          return BadRequestException(
            data['message'] as String? ?? 'Request Failed',
          );
        case 401:
          return RequestUnauthorizedException(
            data['message'] as String? ?? 'Request Unauthorized',
          );
        case 403:
          return RequestForbiddenException(
            data['message'] as String? ?? 'Request Forbidden',
          );
        case 404:
          return RequestNotFoundException(
            data['message'] as String? ?? 'Request Not Found',
          );
        case 405:
          return RequestMethodNotAllowedException(
            data['message'] as String? ?? 'Request Method Not Allowed',
          );
        case 422:
          // return UnprocessableEntityException();
          final errors = data['data'] as Map<String, dynamic>;
          // loop through errors key
          final errorMessages = errors.keys.map((key) {
            final error = errors[key] as List<dynamic>;
            return error.join(', ');
          }).toList();
          return UnprocessableEntityException(errorMessages);
        default:
          return RequestFailedException(
            data['message'] as String? ?? 'Request Failed',
          );
      }
    }
  }
}
