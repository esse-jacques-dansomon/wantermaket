import 'package:dio/dio.dart';

import '../../config/app_constantes.dart';
import '../datasource/dio/dio_client.dart';
import '../datasource/exception/api_error_handler.dart';
import '../models/response/api_response.dart';

class VendorRepo {
  final DioClient dioClient;
  VendorRepo({required this.dioClient});

  Future<ApiResponse> getProductsByBoutique(int boutiqueId) async {
    try {final response = await dioClient.get('${AppConstants.BOUTIQUE_URI}/$boutiqueId/produits');
    return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getBoutiqueById(int boutiqueId) async {
    try {final response = await dioClient.get('${AppConstants.BOUTIQUE_URI}/$boutiqueId');
    return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getVendorId(int vendeurId) async {
    try {final response = await dioClient.get('${AppConstants.VENDEUR_URI}/$vendeurId');
    return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<Response> getVendorStat(int boutiqueId) async {
    try {
      final response = await dioClient.get('${AppConstants.BOUTIQUE_URI}/$boutiqueId/stats');
      print('repos getVendorStats');
      return response;
    } catch (e) {
      throw e;
    }
  }


}