import '../../config/app_constantes.dart';
import '../datasource/dio/dio_client.dart';
import '../datasource/exception/api_error_handler.dart';
import '../models/response/api_response.dart';

class SearchRepo {
  final DioClient dioClient;
  SearchRepo({required this.dioClient});

  Future<ApiResponse> search(String query) async {
    try {
      final response = await dioClient.get('${AppConstants.SEARCH_URI}/$query');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}