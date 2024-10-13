import 'dart:developer';
import 'dart:io';

import 'package:flutter_ecogrow_customer/data/model/category_response_model.dart';
import 'package:flutter_ecogrow_customer/data/model/product_detail_response_model.dart';
import 'package:flutter_ecogrow_customer/data/model/product_recent_response_model.dart';
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
      final res = await _dio.post('https://ecogrowmarketplace.com/api/product/show_product_detail_on_screen');
      return ProductDetailResponseModel.fromJson(res);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ProductRecentResponseModel> getProductRecent() async {
    try {
      final res = await _dio.post(AppApi.productRecent);
      return ProductRecentResponseModel.fromJson(res);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ProductDetailResponseModel> getProductDetailById({required String id}) async {
    try {
      final res = await _dio.post(
        AppApi.productDetail,
        // headers: {
        //   'Authorization': '',
        //   'Content-Type': 'application/json',
        //   'Accept': 'application/json',
        // },
        body: {
          'id': id,
        },
      );
      return ProductDetailResponseModel.fromJson(res);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ProductResponseModel> getProductList() async {
    try {
      final res = await _dio.post('https://ecogrowmarketplace.com/api/product/show_product_on_screen', headers: {
        'Authorization': '',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      log('${_dio.getAccessToken()}');

      return ProductResponseModel.fromJson(res);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<CategoryResponseModel> getCategory() async {
    try {
      final res = await _dio.post(
        AppApi.category,
      );

      return CategoryResponseModel.fromJson(res);
    } catch (e) {
      throw Exception(e);
    }
  }

  // Future<void> testSeller() async {
  //   try {
  //     final res = await _dio.post(
  //       'https://ecogrowmarketplace.com/api/report/get_invoice_by_status',
  //       headers: {
  //         'Authentication': 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjhkOWJlZmQzZWZmY2JiYzgyYzgzYWQwYzk3MmM4ZWE5NzhmNmYxMzciLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vZWNvZ3Jvdy1tYXJrZXRwbGFjZSIsImF1ZCI6ImVjb2dyb3ctbWFya2V0cGxhY2UiLCJhdXRoX3RpbWUiOjE3Mjg3MzY4NzQsInVzZXJfaWQiOiI1ajdabkM2M05DaDdBVkFEVEd6c2hWTUpFVXgyIiwic3ViIjoiNWo3Wm5DNjNOQ2g3QVZBRFRHenNoVk1KRVV4MiIsImlhdCI6MTcyODgwNDQ3MiwiZXhwIjoxNzI4ODA4MDcyLCJwaG9uZV9udW1iZXIiOiIrODU1ODc3ODU0NTQiLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7InBob25lIjpbIis4NTU4Nzc4NTQ1NCJdfSwic2lnbl9pbl9wcm92aWRlciI6InBob25lIn19.hZC2e_3p7vFzill-9pO0__GK2IGerCEAYo7fye7y8ra1xaym9PVmYy8rjujkvPuKr39MR-paDPkZWlBWLAexmYuS4vyU8hotfIJS73y6UlXeu92FS4-xoh4QOEM10bRaOmNcCTfp52zUN8aKagAD6BQwl9gsLMsqA5O1N_nxMjQYFw6PacWkC3l2c-tMg5ku1Eeb1MKBcVpRfRnQY0XfJwbKTkly4UwhbZXEcAysjMgfCMHoYKNAGuVpPVibIW3VsMgykjLRv-y_MM2af3Voa0bzM7034NmX5FlaeEBSPNV-wYchNR8zLXV1Dff9gL64TkQxoh8nYS3ewryc-dd5Gw',
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'Accept-Encoding' : 'gzip, deflate, br',
  //
  //       },
  //       body: {
  //         "status_id": 5,
  //       },
  //     );
  //     log('Test seller ${res}');
  //   }  on SocketException catch (e) {
  //     log('SocketException: $e');
  //   } on HttpException catch (e) {
  //     log('HttpException: $e');
  //   } on FormatException catch (e) {
  //     log('FormatException: $e');
  //   } catch (e) {
  //     log('Exception: $e');
  //   }
  // }

  Future<ProductResponseModel> getProductByCategory({required int id}) async {
    try {
      final res = await _dio.post(AppApi.productByCategories, body: {
        'id': id,
      });
      return ProductResponseModel.fromJson(res);
    } catch (e) {
      throw Exception(e);
    }
  }
}
