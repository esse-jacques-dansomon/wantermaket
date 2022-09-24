import 'package:dio/dio.dart';

class ApiResponse {
   Response response;
   dynamic error;

  ApiResponse( this.response,  this.error);

  ApiResponse.withError(dynamic errorValue)
      : response = Response(requestOptions: new RequestOptions(path: ""), statusCode: 400),
        error = errorValue;

  ApiResponse.withSuccess(Response responseValue)
      : response = responseValue,
        error = null;
}
