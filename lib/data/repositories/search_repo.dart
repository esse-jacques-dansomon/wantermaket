// ignore_for_file: unused_element, unused_import

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:wantermarket/data/models/body/filter_model.dart';

import '../../config/app_constantes.dart';
import '../datasource/dio/dio_client.dart';
import '../datasource/exception/api_error_handler.dart';
import '../models/response/api_response.dart';

class SearchRepo {
  final DioClient dioClient;
  SearchRepo({required this.dioClient});

  Future<ApiResponse> search( {required FilterModel filterModel, required int page }  ) async {
    try {
      final response =  await dioClient.post(AppConstants.SEARCH_URI , data: filterModel.toMap(), queryParameters: {'page': page});
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