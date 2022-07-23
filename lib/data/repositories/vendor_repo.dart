
import 'package:dio/dio.dart';

import '../../config/app_constantes.dart';
import '../datasource/dio/dio_client.dart';
import '../datasource/exception/api_error_handler.dart';
import '../models/response/api_response.dart';

class VendorRepo {
  final DioClient dioClient;
  VendorRepo({required this.dioClient});

  Future<ApiResponse> getUserConnectedProducts() async {
    try {final response = await dioClient.get(AppConstants.VENDOR_PRODUCTS_URI);
    return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getUserConnectedBoutique() async {
    try {final response = await dioClient.get(AppConstants.VENDOR_BOUTIQUE_URI);
    return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getUserConnectedStat() async {
    try {
      final response = await dioClient.get(AppConstants.VENDOR_STATS_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> incrementProductView(int idProduct) async {
    try {
      final response = await dioClient.get('${AppConstants.PRODUITS_URI}/$idProduct/views');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateBoutique(FormData data) async {
    final response = await dioClient.post(AppConstants.BOUTIQUE_update_URI, data: data);
    try {
      print(response.statusCode);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print('failure') ;
      print(response.statusMessage);
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


}