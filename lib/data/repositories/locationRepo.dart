import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app_constantes.dart';
import '../datasource/dio/dio_client.dart';
import '../datasource/exception/api_error_handler.dart';
import '../models/response/api_response.dart';


class LocationRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  LocationRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> getAllCountries() async {
    try {
      final response = await dioClient.get(AppConstants.URI_COUNTRIES);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


}
