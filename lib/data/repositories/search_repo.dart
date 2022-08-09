import 'dart:convert';

import 'package:wantermarket/data/models/body/filter_model.dart';

import '../../config/app_constantes.dart';
import '../datasource/dio/dio_client.dart';
import '../datasource/exception/api_error_handler.dart';
import '../models/response/api_response.dart';

class SearchRepo {
  final DioClient dioClient;
  SearchRepo({required this.dioClient});
  Future<ApiResponse>
  search( {required FilterModel filterModel}) async {
    try {
      print(filterModel.toJson());
      final response = await dioClient.get(AppConstants.SEARCH_URI , queryParameters: filterModel.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  _getUri({required FilterModel filterModel}){
    return "${AppConstants.SEARCH_URI}"
        "?keyWord=${filterModel.keyWorld}";
  }
}