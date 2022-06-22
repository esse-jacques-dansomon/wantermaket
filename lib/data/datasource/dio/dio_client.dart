import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  final String baseUrl;
  // final LoggingInterceptor loggingInterceptor;
  final SharedPreferences sharedPreferences;

  Dio dio = Dio();
  String token = '';
  String countryCode = '';

  DioClient(this.baseUrl,
      Dio dioC, {
        // this.loggingInterceptor,
        required this.sharedPreferences,
      }) {
    // token = sharedPreferences.getString(AppConstants.TOKEN);
    // countryCode = sharedPreferences.getString(AppConstants.COUNTRY_CODE) ?? AppConstants.languages[0].countryCode;
    print("NNNN $token");
    dio = dioC;
    dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 30000
      ..options.receiveTimeout = 30000
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
        // AppConstants.LANG_KEY : countryCode == 'US'? 'en':countryCode.toLowerCase(),

      };
    // dio.interceptors.add(loggingInterceptor);
  }

  void updateHeader(String token, String countryCode) {
    // token = token == null ? this.token : token;
    // countryCode = countryCode == null ? this.countryCode == 'US' ? 'en': this.countryCode.toLowerCase(): countryCode == 'US' ? 'en' : countryCode.toLowerCase();
    // this.token = token;
    // this.countryCode = countryCode;
    // print('===Country code====>$countryCode');
    // dio.options.headers = {
    //   'Content-Type': 'application/json; charset=UTF-8',
    //   'Authorization': 'Bearer $token',
    //   AppConstants.LANG_KEY: countryCode == 'US'? 'en':countryCode.toLowerCase(),
    // };
  }

  Future<Response> get(String uri, {
    required Map<String, dynamic> queryParameters,
    Options ?options,
    CancelToken ?cancelToken,
    ProgressCallback ?onReceiveProgress,
  }) async {
    try {
      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      print(response);
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }
  //
  // Future<Response> post(String uri, {
  //   data,
  //   Map<String, dynamic> queryParameters,
  //   Options options,
  //   CancelToken cancelToken,
  //   ProgressCallback onSendProgress,
  //   ProgressCallback onReceiveProgress,
  // }) async {
  //   try {
  //     var response = await dio.post(
  //       uri,
  //       data: data,
  //       queryParameters: queryParameters,
  //       options: options,
  //       cancelToken: cancelToken,
  //       onSendProgress: onSendProgress,
  //       onReceiveProgress: onReceiveProgress,
  //     );
  //     return response;
  //   } on FormatException catch (_) {
  //     throw FormatException("Unable to process the data");
  //   } catch (e) {
  //     throw e;
  //   }
  // }
  //
  // Future<Response> put(String uri, {
  //   data,
  //   Map<String, dynamic> queryParameters,
  //   Options options,
  //   CancelToken cancelToken,
  //   ProgressCallback onSendProgress,
  //   ProgressCallback onReceiveProgress,
  // }) async {
  //   try {
  //     var response = await dio.put(
  //       uri,
  //       data: data,
  //       queryParameters: queryParameters,
  //       options: options,
  //       cancelToken: cancelToken,
  //       onSendProgress: onSendProgress,
  //       onReceiveProgress: onReceiveProgress,
  //     );
  //     return response;
  //   } on FormatException catch (_) {
  //     throw FormatException("Unable to process the data");
  //   } catch (e) {
  //     throw e;
  //   }
  // }
  //
  // Future<Response> delete(String uri, {
  //   data,
  //   Map<String, dynamic> queryParameters,
  //   Options options,
  //   CancelToken cancelToken,
  // }) async {
  //   try {
  //     var response = await dio.delete(
  //       uri,
  //       data: data,
  //       queryParameters: queryParameters,
  //       options: options,
  //       cancelToken: cancelToken,
  //     );
  //     return response;
  //   } on FormatException catch (_) {
  //     throw FormatException("Unable to process the data");
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
