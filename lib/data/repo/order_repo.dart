import 'package:flutter_ecogrow_customer/data/model/cart_list_response_model.dart';
import 'package:flutter_ecogrow_customer/data/model/checkout_request_model.dart';
import 'package:flutter_ecogrow_customer/data/model/order_detail_response_model.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:http_client/http_client.dart';

class OrderRepo {
  OrderRepo({
    required DioHttpClient dio,
  }) : _dio = dio;

  final DioHttpClient _dio;

  Future<void> checkOut({required CheckoutRequestModel checkoutRequestModel}) async {
    try {
      final body = checkoutRequestModel.toJson();

      print(body);

      await _dio.post(AppApi.checkOut, body: body);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<OrderDetailResponseModel> getOrderDetail() async {
    try {
      final response = await _dio.post(AppApi.orderDetail);
      return OrderDetailResponseModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }
}
