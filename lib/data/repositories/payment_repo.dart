import '../../config/app_constantes.dart';
import '../datasource/dio/dio_client.dart';
import '../datasource/exception/api_error_handler.dart';
import '../models/response/api_response.dart';

class PaymentRepo {
  DioClient dioClient;
  PaymentRepo({required this.dioClient});

  Future<ApiResponse> getBecameExclusiveLink() async {
    try {
      final response = await dioClient.post(AppConstants.PAY_BECOME_EXCLUSIVE_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getAbonnementLink(int idPlan) async {
    try {
      final response = await dioClient.post(AppConstants.PAY_ABONNEMENT_URI, data: {'plan_id': idPlan}.toString());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
