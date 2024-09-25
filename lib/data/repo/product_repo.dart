import 'package:flutter_ecogrow_customer/data/model/product_detail_model.dart';
import 'package:flutter_ecogrow_customer/data/model/product_list_response_model.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:http_client/http_client.dart';

class ProductRepo {
  ProductRepo({
    required DioHttpClient dio,
  }) : _dio = dio;

  final DioHttpClient _dio;

  Future<ProductDetailResponseModel> getProductDetail() async {
    try {
      final res = await _dio.get(AppApi.productDetail);
      return ProductDetailResponseModel.fromJson(res);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ProductListResponseModel> getProductList() async {
    try {
      final res = await _dio.get('${AppApi.fakeData}${AppApi.productList}');
      return ProductListResponseModel.fromJson(res);
    } catch (e) {
      throw Exception(e);
    }
  }
}
