import 'package:dio/dio.dart';

class ApiResponse {
   Response response;
  final dynamic error;

  ApiResponse(  this.response,  this.error);

  ApiResponse.withError(dynamic errorValue)
      : response = Response(statusCode: 500, requestOptions: RequestOptions(path: '')),
        error = errorValue;

  ApiResponse.withSuccess(Response responseValue)
      : response = responseValue,
        error = null;
}
