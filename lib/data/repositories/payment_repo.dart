import 'dart:convert';

import 'package:wantermarket/data/models/body/product.dart';

import '../../config/app_constantes.dart';
import '../datasource/dio/dio_client.dart';
import '../datasource/exception/api_error_handler.dart';
import '../models/response/api_response.dart';

class PaymentRepo {
  DioClient dioClient;
  PaymentRepo({required this.dioClient});

  Future<ApiResponse> getBecameExclusiveLink() async {
    try {
      final response =
          await dioClient.post(AppConstants.PAY_BECOME_EXCLUSIVE_URI, data: {});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getAbonnementLink(int idPlan) async {
    try {
      final response = await dioClient.post(AppConstants.PAY_ABONNEMENT_URI,
          data: jsonEncode({'plan_id': idPlan}));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getBoosterProductLink(Product product) async {
    try {
      final response = await dioClient.post(
          AppConstants.PAY_BOOSTER_PRODUCT_URI,
          data: jsonEncode({'produit_id': product.id}));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getStatusPayment() async {
    try {
      final response = await dioClient.get(AppConstants.PAY_ETAT_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> submitMobilePayment(data) async {
    print("arriver au repo");
    try {
      final response =
          await dioClient.post(AppConstants.PAY_MOBILE_URI, data: data);
      print(response);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
