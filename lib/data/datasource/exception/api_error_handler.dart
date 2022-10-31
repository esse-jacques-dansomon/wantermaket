import 'package:dio/dio.dart';

import '../../models/response/api_errors.dart';

class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              errorDescription = "Request to API server was cancelled";
              break;
            case DioErrorType.connectTimeout:
              errorDescription = "Connection timeout with API server";
              break;
            case DioErrorType.other:
              errorDescription =
              "Connection to API server failed due to internet connection";
              break;
            case DioErrorType.receiveTimeout:
              errorDescription =
              "Receive timeout in connection with API server";
              break;
            case DioErrorType.response:
              switch (error.response?.statusCode) {
                case 404:
                  //french
                  errorDescription = "La ressource demandée n'existe pas";
                  break;
                case 500:
                  //french
                  errorDescription = "Erreur interne du serveur";
                  break;
                case 503:
                  //french
                  errorDescription = "Service indisponible";
                  break;
                default:
                  ErrorResponse errorResponse;
                  try{
                    errorResponse = ErrorResponse.fromJson(error.response?.data);
                    if (errorResponse.success == false) {
                      errorDescription = errorResponse;
                    } else {
                      errorDescription =
                      "${error.response!.data['message']}";
                    }
                  }catch(e){
                    errorDescription = error.response?.data.toString();
                  }
              }
              break;
            case DioErrorType.sendTimeout:
              errorDescription = "Send timeout with server";
              break;
          }
        } else {
          errorDescription = "Unexpected error occured";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else{
      errorDescription = error.toString();

    }
    return errorDescription;
  }
}
