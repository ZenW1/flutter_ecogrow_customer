import 'dart:convert';
import 'dart:io';

class AppConstant {
  static const String languageKey = 'language';
  static const String defaultLanguage = 'km_KH';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';
  static const String user = 'user';
  static const String cartKey = '____cart____';
  static const String userKey = '____user____';
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
  static const String addLocation = '/add_location';
  static const String deleteLocation = '/delete_location';
  static const String getLocation = '/get_location';
  static const String productDetail = '6d76ca60-07a6-44ba-8af3-1b8ea3e4de06';
  static const String productDetailDummy = 'https://400b-119-13-156-84.ngrok-free.app/api/product/show_product_detail_on_screen';
  static const String location = 'fe6a9a94-833f-4f9d-8d02-e982210845e8';
  static const String productList = '609ff4af-f8bf-4ee7-a1d7-9430f848cc8c';
  static const String productListDummy = 'https://400b-119-13-156-84.ngrok-free.app/api/product/show_product_on_screen';
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
