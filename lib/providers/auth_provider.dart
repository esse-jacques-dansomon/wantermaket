import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_constantes.dart';
import 'package:wantermarket/data/models/body/login_model.dart';

import '../data/models/body/login_response.dart';
import '../data/models/body/user_base_info.dart';
import '../data/repositories/auth_repo.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepo authRepo;
  AuthProvider({required this.authRepo});

  bool _isLoading = false;
  bool loginn = false;
  int shop = 0;
  LoginReponse user = LoginReponse();
  bool get isLoading => _isLoading;


  Future<bool> login(LoginModel loginModel) async {
    _isLoading = true;
    notifyListeners();
    final response = await authRepo.login(loginModel);
    _isLoading = false;
    notifyListeners();
    if(response.error == null){
      print('=====================?${response.response.data}');
      await authRepo.saveToken(response.response.data['access_token']);
      await authRepo.saveInfoInShared(AppConstants.VENDOR_ID ,response.response.data['vendeur_id'].toString());
      await authRepo.saveInfoInShared(AppConstants.BOUTIQUE_ID ,response.response.data['boutique_id'].toString());
      await authRepo.saveInfoInShared(AppConstants.BOUTIQUE_NAME,response.response.data['boutique_name']);
      await authRepo.saveInfoInShared(AppConstants.ADRESSE,response.response.data['adresse']);
      await authRepo.saveInfoInShared(AppConstants.PROFILE_IMAGE ,response.response.data['profil_image']);
      await authRepo.saveInfoInShared(AppConstants.TYPE_PLAN ,response.response.data['plan']);
      await authRepo.saveInfoInShared(AppConstants.CAN_ADD_PRODUCT ,response.response.data['canAddProduct'].toString());
      await authRepo.saveInfoInShared(AppConstants.ETAT_ABONNEMENT ,response.response.data['etat'].toString());
      await authRepo.saveInfoInShared(AppConstants.USER_CREDENTIALS, json.encode(response.response.data));
      getUserConnectedInfo();
      loginn = true;
      notifyListeners();
      return true;
    }else{
      print(response.error);
      return false;
    }
  }

  Future<void> getUserConnectedInfo() async {
    print('getUserConnectedInfo');
    dynamic userp = await getValueFromSP(AppConstants.USER_CREDENTIALS);
    user = LoginReponse.fromJson(json.decode(userp));
    print('=====================?${user.boutiqueName}');
    notifyListeners();

  }

  Future<void> getUserShop() async {
    // var p = await getValueFromSP(AppConstants.BOUTIQUE_ID);
    // shop = int.parse(p);
    // notifyListeners();

  }

  Future<void> logout() async {
    await authRepo.logout();
    notifyListeners();
  }

  Future<String> getToken() async {
    return authRepo.getToken();
  }  
  
  Future<String> getValueFromSP(String name) async {
    return authRepo.getValueFromSh(name);
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }



}