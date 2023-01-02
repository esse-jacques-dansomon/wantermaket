import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/app_constantes.dart';

class DioClient {
  final String baseUrl;
  // final LoggingInterceptor loggingInterceptor;
  final SharedPreferences sharedPreferences;

  Dio dio = Dio();
  String token = '';
  String countryCode = '';

  DioClient(this.baseUrl, Dio dioC, this.sharedPreferences) {
    token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';
    countryCode = sharedPreferences.getString(AppConstants.COUNTRY_CODE) ??
        AppConstants.languages[0].code;
    dio = dioC;
    dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 30000
      ..options.receiveTimeout = 30000
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        AppConstants.COUNTRY_CODE: countryCode.toUpperCase(),
      };

    // dio.interceptors.add(loggingInterceptor);
  }

  void updateHeader(String countryCode) {
    token = token;
    countryCode = countryCode;
    this.countryCode = countryCode;
    dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      AppConstants.COUNTRY_CODE: countryCode,
    };
  }

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      dio.options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${sharedPreferences.getString(AppConstants.TOKEN)}',
        AppConstants.COUNTRY_CODE: countryCode.toUpperCase(),
      };
      token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';

      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${sharedPreferences.getString(AppConstants.TOKEN)}',
      AppConstants.COUNTRY_CODE: countryCode,
    };
    // 60sec
    dio.options.connectTimeout = 60000;
    dio.options.receiveTimeout = 60000;
    token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';
    
    try {
      var response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${sharedPreferences.getString(AppConstants.TOKEN)}',
      AppConstants.COUNTRY_CODE: countryCode,
    };
    token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';

    try {
      var response = await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${sharedPreferences.getString(AppConstants.TOKEN)}',
      AppConstants.COUNTRY_CODE: countryCode,
    };
    token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';
    try {
      var response = await dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }
}
