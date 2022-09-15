import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_constantes.dart';
import 'package:wantermarket/data/models/body/login_model.dart';
import 'package:wantermarket/data/models/body/register_model.dart';

import '../data/models/body/login_response.dart';
import '../data/models/body/profil_model.dart';
import '../data/models/body/reset_password_model.dart';
import '../data/models/response/api_response.dart';
import '../data/repositories/auth_repo.dart';
import '../shared/api_checker.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepo authRepo;
  AuthProvider({required this.authRepo});

  bool _isLoading = false;
  bool _isLoadingRegister = false;
  bool loginn = false;
  int boutiqueId = 0;
  LoginReponse user = LoginReponse();
  bool get isLoading => _isLoading;
  bool get isLoadingRegister => _isLoadingRegister;


  Future<bool> login(LoginModel loginModel, BuildContext context) async {
    _isLoading =  true;
    notifyListeners();
    final response = await authRepo.login(loginModel);
    _isLoading = false;
    notifyListeners();
    if(response.error == null){
      await authRepo.saveToken(response.response.data['access_token']);
      authRepo.saveInfoInShared(AppConstants.USER_CREDENTIALS, json.encode(response.response.data));
      //save user info
      user = LoginReponse.fromJson(response.response.data);
      return true;

    }else{

      return false;
    }
  }

  Future<void> register(RegisterModel registerModel,BuildContext context) async {
    try{
      _isLoadingRegister = true;
      notifyListeners();
      final response = await authRepo.register(registerModel);
      _isLoadingRegister = false;
      notifyListeners();

      if(response.error == null){
        await authRepo.saveToken(response.response.data['access_token']);
        //save token
        authRepo.saveInfoInShared(AppConstants.USER_CREDENTIALS, json.encode(response.response.data));
        //save user info
        user = LoginReponse.fromJson(response.response.data);
        notifyListeners();
      }else{
        _isLoadingRegister = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Une errue s\'est produite, veuillez reessayez', style: TextStyle(color: Colors.white)), backgroundColor: Colors.red));

      }

    }catch(e){
      _isLoadingRegister = false;
      notifyListeners();
      print(e);
    }

  }

  Future<bool> editProfile(EditProfileModel editProfileModel) async {
    _isLoadingRegister = true;
    notifyListeners();
    final response = await authRepo.editProfile(editProfileModel);
     if(response.error == null){
       _isLoadingRegister = false;
       notifyListeners();
      return true;
     }else {
       _isLoadingRegister = false;
       notifyListeners();
      return false;
     }
  }

  Future<bool> resetPassword(ResetPasswordModel passwordModel) async {
    _isLoading =  true;
    notifyListeners();
    final response = await authRepo.resetPassword(passwordModel);
    _isLoading = false;
    notifyListeners();
    print(response.response.statusCode);
    if(response.error == null){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> forgotPassword(String email) async {
    _isLoading =  true;
    notifyListeners();
    final response = await authRepo.forgotPassword(email);
    _isLoading = false;
    notifyListeners();
    if(response.error == null){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> verifyOpt(String email, String otp) async {
    _isLoading =  true;
    notifyListeners();
    final response = await authRepo.verifyOtp(email, otp);
    _isLoading = false;
    notifyListeners();
    if(response.error == null){
      return true;
    }else{
      return false;
    }
  }

  Future<void> logout() async {

    loginn = false;
    user = LoginReponse();
    boutiqueId = 0;
    await authRepo.clearSharedPreferences();
    notifyListeners();
    final response = await authRepo.logout();
    if(response.error == null){
      loginn = false;
      user = LoginReponse();
      boutiqueId = 0;
      await authRepo.clearSharedPreferences();
      notifyListeners();
    }else{
      await authRepo.clearSharedPreferences();
      print(response.error);
    }
  }

  Future<void> updateToken() async {
    ApiResponse apiResponse = await authRepo.updateToken();
    if (apiResponse.response.statusCode == 200) {
       return ;
    } else {
    }
    // ApiChecker.checkApi(context, apiResponse);

  }

  Future<void> verifyIsAuthenticated() async {
    try{
      final response0 = await authRepo.getUserConnectedInfo();
      final response = response0.response;
      if(response.statusCode == 200){
        loginn = true;
        user = LoginReponse.fromJson(response.data);
        authRepo.saveInfoInShared(AppConstants.USER_CREDENTIALS, json.encode(response.data));
      }else{
        clearall();
      }
    }catch(e){
      clearall();

    }

  }

  LoginReponse? getUserConnectedInfo()  {
    String? response =  authRepo.sharedPreferences.getString(AppConstants.USER_CREDENTIALS);
    if (response == null) return null;
    return LoginReponse.fromJson(json.decode(response));
  }

  Future<void> clearall() async {
    await authRepo.clearAll();
    user = LoginReponse();
    loginn = false;
    notifyListeners();
  }

  Future<String> getToken() async {
    return authRepo.getToken();
  }

  Future<String> getValueFromSP(String name) async {
    return await authRepo.getValueFromSh(name);
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }



}