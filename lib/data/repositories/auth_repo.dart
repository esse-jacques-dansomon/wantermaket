import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wantermarket/data/models/body/login_model.dart';
import 'package:wantermarket/data/models/body/user_base_info.dart';

import '../../config/app_constantes.dart';
import '../datasource/dio/dio_client.dart';
import '../datasource/exception/api_error_handler.dart';
import '../models/response/api_response.dart';

class AuthRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> login(LoginModel loginModel) async {
    try {
      final response = await dioClient.post(AppConstants.LOGIN_URI, data: loginModel.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }



  Future<void> saveToken(String token) async {
    try {
      await sharedPreferences.setString(AppConstants.TOKEN, token);
    } catch (e) {
      throw e;
    }
  }

  Future<void> saveInfoInShared(String name, String value) async {
    try {
      await sharedPreferences.setString(name, value);
    } catch (e) {
      throw e;
    }
  }

  Future<void> saveUserConnectedInfo(UserBaseInfo userBaseInfo) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_CREDENTIALS, json.encode(userBaseInfo));
    } catch (e) {
      throw e;
    }
  }

  Future <UserBaseInfo> readUserConnectedInfo() async {
    try {
      final user = await sharedPreferences.getString(AppConstants.USER_CREDENTIALS);
      return UserBaseInfo.fromJson(json.decode(user!));
    } catch (e) {
      throw e;
    }
  }

  Future<ApiResponse> getUserConnectedInfo() async {
    try {
      final response = await dioClient.get(AppConstants.USER_CONNECTED_INFO);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<String> getToken() async {
    return sharedPreferences.getString(AppConstants.TOKEN)?? "";
  }

  Future<String> getValueFromSh(String name) async {
    return sharedPreferences.getString(name)?? "";
  }

  bool  isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN) ;
  }

  Future<void> logout() async {
    try {
      await sharedPreferences.clear();
    } catch (e) {
      throw e;
    }
  }






}