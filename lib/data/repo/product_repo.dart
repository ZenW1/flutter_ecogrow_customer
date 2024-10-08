import 'package:flutter_ecogrow_customer/app/view/app.dart';
import 'package:flutter_ecogrow_customer/data/model/product_detail_response_model.dart';
import 'package:flutter_ecogrow_customer/data/model/product_response_model.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:http_client/http_client.dart';

class ProductRepo {
  ProductRepo({
    required DioHttpClient dio,
  }) : _dio = dio;

  final DioHttpClient _dio;

  Future<ProductDetailResponseModel> getProductDetail() async {
    try {
      final res = await _dio.get('${AppApi.fakeData}${AppApi.productDetail}');
      return ProductDetailResponseModel.fromJson(res);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ProductDetailResponseModel> getProductDetailById({required String id}) async {
    try {
      final res = await _dio.post(AppApi.productDetailDummy, body: {'id': id});
      return ProductDetailResponseModel.fromJson(res);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ProductResponseModel> getProductList() async {
    try {
      final res = await _dio.get('${AppApi.fakeData}${AppApi.productList}');
      return ProductResponseModel.fromJson(res);
    } catch (e) {
      throw Exception(e);
    }
  }
}
