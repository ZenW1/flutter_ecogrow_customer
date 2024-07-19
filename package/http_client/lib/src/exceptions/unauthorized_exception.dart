import 'package:http_client/http_client.dart';

class UnauthorizedException extends HttpException {
  UnauthorizedException(String message) : super(message, 401);

  @override
  String toString() => 'UnauthorizedException: $message';
}
