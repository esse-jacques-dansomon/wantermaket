
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

  Future<ApiResponse> getVendorId(int vendeurId) async {
    try {final response = await dioClient.get('${AppConstants.VENDEUR_URI}/$vendeurId');
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

  Future<ApiResponse> updateBoutique(int boutiqueId, Map<String, dynamic> data) async {
    try {
      final response = await dioClient.put('${AppConstants.BOUTIQUE_URI}/$boutiqueId', data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


}