import 'dart:convert';
import 'dart:io';

class AppConstant {
  static const String languageKey = 'language';
  static const String defaultLanguage = 'km_KH';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';
  static const String user = 'user';
}

enum OrderStatus {
  all,
  processing,
  pending,
  completed,
  cancelled,
}

class AppApi {
  static const String baseUrl = 'https://ecogrowmarketplace.com/api/customer';
  static const String fakeData = 'https://mocki.io/v1/';
  static const String login = '/login';
  static const String register = '/register';
  static const String updateProfile = '/profile';
  static const String productDetail = '60ae3dcf-0844-41d8-b6d0-522b2e61cf99';
  static const String location = 'fe6a9a94-833f-4f9d-8d02-e982210845e8';
  static const String productList = '4b669f14-4c9b-4877-9894-5b5f30b72925';
  static const String cart = '93db2f95-0925-4522-8cca-033a94a9d5ce';
}


class ImageConstants {
  static final ImageConstants constants = ImageConstants._();
  factory ImageConstants() => constants;
  ImageConstants._();
  dynamic convertToBase64(File file) {
    List<int> imageBytes = file.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);

    return 'data:image/jpeg;base64,$base64Image';
  }
  dynamic decodeBase64(String encoded) {
    String decoded = utf8.decode(base64Url.decode(encoded));
    return decoded;
  }
}