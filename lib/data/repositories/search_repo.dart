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
  Future<Response>
  search( {required FilterModel filterModel}) async {
    try {
      print(filterModel.toJson());
      final response =  dioClient.post(AppConstants.SEARCH_URI ,
          data: filterModel.toMap());
      return response;
    } catch (e) {
      print(e);
      return throw DioError(error: e, requestOptions: RequestOptions(path: AppConstants.SEARCH_URI), );
    }
  }

  Future<ApiResponse> searchPost( {required FilterModel filterModel}) async {
    try {
      print(filterModel.toJson());
      final response = await dioClient.post(AppConstants.SEARCH_URI ,
          options: Options(
            headers: {
<<<<<<< HEAD
              'Content-Type': 'application/json; charset=UTF-8',
              'Accept': 'application/json',
=======
              'Content-Type': 'application/json ; charset=UTF-8',
              'chartset': 'utf-8',
>>>>>>> 4b01334959a947601462b985e3b7cbf4d41a7220
            },
          ),
          data: filterModel.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e);
      return throw DioError(error: e, requestOptions: RequestOptions(path: AppConstants.SEARCH_URI), );
    }
  }

  _getUri({required FilterModel filterModel}){
    return "${AppConstants.SEARCH_URI}"
        "?keyWord=${filterModel.keyWorld}";
  }
}