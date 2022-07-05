import 'package:dio/dio.dart';
import 'package:wantermarket/config/app_constantes.dart';

import '../datasource/dio/dio_client.dart';
import '../datasource/exception/api_error_handler.dart';
import '../models/body/slider.dart';
import '../models/response/api_response.dart';

class SliderRepo{
  final DioClient dioClient;
  SliderRepo({required this.dioClient});

  Future<ApiResponse> getSliders() async {
    try{
      final response = await dioClient.get(AppConstants.SLIDER_URI);
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}