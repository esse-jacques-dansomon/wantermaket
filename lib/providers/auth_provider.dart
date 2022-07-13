import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_constantes.dart';
import 'package:wantermarket/data/models/body/login_model.dart';
import 'package:wantermarket/data/models/body/register_model.dart';

import '../data/models/body/login_response.dart';
import '../data/repositories/auth_repo.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepo authRepo;
  AuthProvider({required this.authRepo});

  bool _isLoading = false;
  bool _isLoadingRegister = false;
  bool loginn = false;
  int boutiqueId = 53;
  LoginReponse user = LoginReponse();
  bool get isLoading => _isLoading;
  bool get isLoadingRegister => _isLoadingRegister;


  Future<void> login(LoginModel loginModel, BuildContext context) async {
    _isLoading = false;
    notifyListeners();
    final response = await authRepo.login(loginModel);
    _isLoading = false;
    notifyListeners();
    if(response.error == null){
      await authRepo.saveToken(response.response.data['access_token']);
      await authRepo.sharedPreferences.setInt(AppConstants.BOUTIQUE_ID,response.response.data['boutique_id']);
      //save token
      authRepo.saveInfoInShared(AppConstants.USER_CREDENTIALS, json.encode(response.response.data));
      //save user info
      user = LoginReponse.fromJson(response.response.data);
      // await Future.delayed(const Duration(seconds: 1));
      //
      // // getUserConnectedInfo();
      // while(user.boutiqueId == null){
      //   await Future.delayed(const Duration(seconds: 1));
      //   user = LoginReponse.fromJson(response.response.data);
      // }
      notifyListeners();

    }else{
      if(response.error is String){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.error, style: TextStyle(color: Colors.white)), backgroundColor: Colors.red));

      }
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
        if(response.error is String){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.error, style: TextStyle(color: Colors.white)), backgroundColor: Colors.red));

        }
      }
    }catch(e){
      _isLoadingRegister = false;
      notifyListeners();
      print(e);
    }

  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();
    final response = await authRepo.logout();
    _isLoading = false;
    notifyListeners();
    if(response.error == null){
      loginn = false;
      _isLoadingRegister = false;
      _isLoading  = false;
      user = LoginReponse();
      boutiqueId = 0;
      await authRepo.clearSharedPreferences();

      notifyListeners();
    }else{
      print(response.error);
    }
  }

  Future<void> getUserConnectedInfo() async {
    print('getUserConnectedInfo');
    // dynamic userp = await getValueFromSP(AppConstants.USER_CREDENTIALS);
    // user = LoginReponse.fromJson(json.decode(userp));
    // print('=====================?${user.boutiqueId}');

  }

  int get userBoutiqueId  {
    return  authRepo.sharedPreferences.getInt(AppConstants.BOUTIQUE_ID) ?? 53;
  }

  Future<LoginReponse> getUserConnected()  async {
    print('getUserConnectedInfo');
    dynamic userp ;
    await getValueFromSP(AppConstants.USER_CREDENTIALS).then((value) => userp = value).whenComplete(() => print('getUserConnectedInfo'));
    user = LoginReponse.fromJson(json.decode(userp));
    print('=====================?${user.boutiqueId}');
    notifyListeners();
    return user;

  }

  Future<void> getUserShop() async {
    // var p = await getValueFromSP(AppConstants.BOUTIQUE_ID);
    // shop = int.parse(p);
    // notifyListeners();

  }

  Future<void> clearall() async {
    await authRepo.clearAll();
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