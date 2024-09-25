import 'package:flutter_ecogrow_customer/data/model/cart_model.dart';
import 'package:flutter_ecogrow_customer/data/model/product_detail_model.dart';
import 'package:flutter_ecogrow_customer/data/model/product_list_response_model.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:http_client/http_client.dart';

class CartRepo {
  CartRepo({
    required DioHttpClient dio,
  }) : _dio = dio;

  final DioHttpClient _dio;

  Future<CartListResponseModel> getCartList() async {
    try {
      final res = await _dio.get('${AppApi.fakeData}${AppApi.cart}');
      return CartListResponseModel.fromJson(res);
    } catch (e) {
      throw Exception(e);
    }

  }
}
