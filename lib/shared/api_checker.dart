import 'package:flutter/material.dart';

import '../data/models/response/api_response.dart';

class ApiChecker {
  static void checkApi(BuildContext context, ApiResponse apiResponse) {
    if(apiResponse.error is! String && apiResponse.error.errors[0].message == 'Unauthorized.') {

    }else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      print(errorMessage);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage, style: TextStyle(color: Colors.white)), backgroundColor: Colors.red));
    }
  }
}