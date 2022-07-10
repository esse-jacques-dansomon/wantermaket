import 'package:wantermarket/config/app_constantes.dart';
import 'package:wantermarket/data/models/response/api_response.dart';

import '../datasource/dio/dio_client.dart';

class PlanRepo {
  final DioClient dioClient;
  PlanRepo({required this.dioClient});

  Future<ApiResponse> getAllPlans() async{
    try{
      final response = await dioClient.get(AppConstants.PLANS_URI);
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(e.toString());
    }

  }
}