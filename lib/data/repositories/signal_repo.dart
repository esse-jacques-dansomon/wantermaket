// ignore_for_file: unused_element, unused_import

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wantermarket/data/models/body/filter_model.dart';

import '../../config/app_constantes.dart';
import '../datasource/dio/dio_client.dart';
import '../datasource/exception/api_error_handler.dart';
import '../models/response/api_response.dart';

class SignalRepo {
  final DioClient dioClient;
  SignalRepo({required this.dioClient});

  Future<ApiResponse> raison( {required String type }  ) async {
    try {
      final response =  await dioClient.get(AppConstants.URI_RAISONS_SIGNALER, queryParameters: {'type': type});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> signaler( {required String type, required String id , required String raison}  ) async {
    try {
      final response =  await dioClient.post(AppConstants.URI_SIGNALER, data: {'type': type, 'id': id, 'raison': raison});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


}