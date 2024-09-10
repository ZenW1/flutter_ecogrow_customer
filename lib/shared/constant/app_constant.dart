class AppConstant {
  static const String languageKey = 'language';
  static const String defaultLanguage = 'km_KH';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';
}

enum OrderStatus {
  all,
  processing,
  pending,
  completed,
  cancelled,
}

class AppApi {
  static const String baseUrl = 'https://mocki.io/v1/';
  static const String productDetail = '60ae3dcf-0844-41d8-b6d0-522b2e61cf99';
}
