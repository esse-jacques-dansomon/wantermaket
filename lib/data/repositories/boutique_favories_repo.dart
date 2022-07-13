import '../../config/app_constantes.dart';
import '../datasource/dio/dio_client.dart';
import '../datasource/exception/api_error_handler.dart';
import '../models/response/api_response.dart';

class BoutiqueFavoriesRepo {
  final DioClient dioClient;
  BoutiqueFavoriesRepo({required this.dioClient});

  Future<ApiResponse> getMyFavories() async {
    try {
      final response = await dioClient.get(AppConstants.VENDEUR_BOUTIQUES_FAVORIS);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> addFavories(int boutiqueId) async {
    try {
      final response = await dioClient.post('/boutiques/$boutiqueId/favories');
    return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> removeFavories(int boutiqueId) async {
    try {
      final response = await dioClient.delete('/boutiques/$boutiqueId/favories');
    return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}