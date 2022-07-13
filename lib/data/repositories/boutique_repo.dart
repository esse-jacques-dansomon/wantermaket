import 'package:wantermarket/data/datasource/dio/dio_client.dart';

import '../../config/app_constantes.dart';
import '../datasource/exception/api_error_handler.dart';
import '../models/response/api_response.dart';

class BoutiqueRepo {
  final DioClient dioClient;
  BoutiqueRepo({required this.dioClient});


  Future<ApiResponse> getBoutiquesExclusives() async {
    try {final response = await dioClient.get(AppConstants.BOUTIQUES_EXCLUSIVES);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getTopBoutiques() async {
    try {final response = await dioClient.get(AppConstants.BOUTIQUES_EXCLUSIVES);
    return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getProductsByBoutique(int boutiqueId) async {
    try {final response = await dioClient.get('${AppConstants.BOUTIQUE_URI}/$boutiqueId/produits');
    return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateBoutiqueViews(int boutiqueId) async {
    try {final response = await dioClient.get('${AppConstants.BOUTIQUE_URI}/$boutiqueId/increment');
    return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }




}