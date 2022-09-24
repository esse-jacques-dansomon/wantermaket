import 'package:flutter/material.dart';
import 'package:wantermarket/data/models/body/app_country.dart';

import '../config/app_constantes.dart';
import '../data/repositories/locationRepo.dart';
import '../shared/api_checker.dart';

class LocalizationProvider extends ChangeNotifier {
  final LocationRepo  locationRepo;
  LocalizationProvider({required this.locationRepo});


  final List<AppCountry> _countries = [];
  List<AppCountry> get countries => _countries;


  _saveLanguage(String locale) async {
    this.locationRepo.sharedPreferences.setString(AppConstants.COUNTRY_CODE, locale.toLowerCase());
  }

  getAllCountries(BuildContext context) async {
    final response = await locationRepo.getAllCountries();
    if(response.error == null){
      response.response.data.forEach((element) {
        _countries.add(AppCountry.fromJson(element));
      });
      if(this.locationRepo.sharedPreferences.getString(AppConstants.COUNTRY_CODE) == null){
        _saveLanguage(_countries[0].code);
      }
      notifyListeners();
    }else{
      ApiChecker.checkApi(context, response);
    }
  }

  void setLocale(Object? value) {
    this._saveLanguage(value.toString());
    this.locationRepo.dioClient.updateHeader(value.toString().toLowerCase());
    notifyListeners();
  }

  String getCountryCode() {
    String code = locationRepo.sharedPreferences.getString(AppConstants.COUNTRY_CODE) ?? AppConstants.languages[0].code;
    return code;
  }






}