import 'package:flutter_ecogrow_customer/data/model/address_model.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:http_client/http_client.dart';

class AddressRepo {
  AddressRepo({
    required DioHttpClient dio,
  }) : _dio = dio;

  final DioHttpClient _dio;

  Future<AddressModel> getAddress() async {
    try {
      final res = await _dio.get('${AppApi.fakeData}${AppApi.location}');
      return AddressModel.fromJson(res);
    } catch (e) {
      throw Exception(e);
    }
  }
}
