import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wantermarket/data/models/body/login_model.dart';
import 'package:wantermarket/data/models/body/profil_model.dart';
import 'package:wantermarket/data/models/body/register_model.dart';
import 'package:wantermarket/data/models/body/reset_password_model.dart';
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
      return ApiResponse.withError(ApiErrorHandler.getMessage(e.toString()));
    }
  }

  Future<ApiResponse> resetPassword(ResetPasswordModel passwordModel) async {
    try {
      final response = await dioClient.post(AppConstants.RESET_PASSWORD_URI, data: passwordModel.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e.toString()));
    }
  }

  Future<ApiResponse> register(RegisterModel registerModel) async {
    try {
      final response = await dioClient.post(AppConstants.VENDEUR_URI, data: registerModel.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e.toString());
      return ApiResponse.withError(ApiErrorHandler.getMessage(e.toString()));
    }
  }


  Future<ApiResponse>  forgotPassword(String email) async {
    try {
      final response = await dioClient.post(AppConstants.PASSWORD_FORGOT_URI, data: {
        "email": email
      });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e.toString()));
    }
  }  Future<ApiResponse>  verifyOtp(String email,String otp) async {
    try {

      final response = await dioClient.post(AppConstants.PASSWORD_OTP_URI, data: {
        "email": email,
        "otp": otp
      });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e.toString()));
    }
  }


  Future<ApiResponse> editProfile(EditProfileModel editProfileModel) async {
    try {
      final response = await dioClient.post(AppConstants.VENDOR_BOUTIQUE_URI, data: editProfileModel.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e.toString()));
    }
  }


  Future<ApiResponse> logout() async {
    try {
      final response = await dioClient.get(AppConstants.LOGOUT);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateToken() async {
    try {
      String deviceToken = await _getDeviceToken();
      Response response = await dioClient.post(
        AppConstants.TOKEN_URI,
        data: { "firebaseUserToken": deviceToken},
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<String> _getDeviceToken() async {
    String? deviceToken;

    if(Platform.isIOS) {
      deviceToken = await FirebaseMessaging.instance.getAPNSToken() ;
    }else {
      deviceToken = await FirebaseMessaging.instance.getToken() ;
    }

    if (deviceToken != null) {
      print('--------Device Token---------- $deviceToken');
    }
    return deviceToken ?? "";
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
      rethrow;
    }
  }

  Future<String> getToken() async {
    return sharedPreferences.getString(AppConstants.TOKEN)?? "";
  }

  Future<dynamic> getValueFromSh(String name) async {
    return sharedPreferences.getString(name)?? "";
  }

  bool  isLoggedIn() {
    return sharedPreferences.getString(AppConstants.TOKEN) != null;
  }

  Future<void> clearAll() async {
    try {
      var token;
      await getToken().then((value) => token);
      await sharedPreferences.setString(AppConstants.TOKEN, '');
      await sharedPreferences.clear();
      await getToken().then((value) => token);
    } catch (e) {
      throw e;
    }
  }

  Future<void> clearSharedPreferences() async {
    try {
      await sharedPreferences.clear();
    } catch (e) {
      throw e;
    }
  }



}

