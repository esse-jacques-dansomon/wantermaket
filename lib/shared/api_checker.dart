import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/data/models/response/api_errors.dart';
import 'package:wantermarket/providers/auth_provider.dart';

import '../data/models/response/api_response.dart';
import '../route/routes.dart';

class ApiChecker {
  static void checkApi(BuildContext context, ApiResponse apiResponse) {

    if(apiResponse.error is! String  && apiResponse.error.code == 401){
      Provider.of<AuthProvider>(context, listen: false).logout(sendRequest: false);
      Navigator.popAndPushNamed(context, AppRoutes.login);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Vous n'avez pas l'autorisation pour cette action", style: TextStyle(color: Colors.white)), backgroundColor: Colors.red));

    }else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else if (apiResponse.error is ErrorResponse){
        ErrorResponse er = apiResponse.error as ErrorResponse;
        errorMessage = er.message;
      }else{
        errorMessage = "Une erreur s'est produite";
      }
      AnimatedSnackBar.material(
        errorMessage,
        type: AnimatedSnackBarType.error,
        desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
      ).show(context);

    }
  }
}