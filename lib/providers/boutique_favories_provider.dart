// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/data/repositories/boutique_favories_repo.dart';
import 'package:wantermarket/providers/vendor_provider.dart';
import 'package:wantermarket/shared/api_checker.dart';

import '../data/models/body/boutique.dart';
import 'auth_provider.dart';

class BoutiqueFavoriesProvider extends ChangeNotifier{
  final BoutiqueFavoriesRepo boutiqueFavoriesRepo;

  BoutiqueFavoriesProvider({required this.boutiqueFavoriesRepo});

  final List<Boutique> _boutiquesFavories = [];
  List<Boutique> get boutiquesFavories => _boutiquesFavories;

  void getAllMyFavories(BuildContext context) async {
    boutiquesFavories.clear();
    final response = await boutiqueFavoriesRepo.getMyFavories();
    if(response.response.statusCode == 200){
      response.response.data.forEach((element) {
        boutiquesFavories.add(Boutique.fromJson(element));
      });
    }else{
      ApiChecker.checkApi( context,  response);
    }
    notifyListeners();
  }

  void addFavory(int boutiqueId, BuildContext context) async {
    final response = await boutiqueFavoriesRepo.addFavories(boutiqueId);
    if(response.response.statusCode == 200){
      updateFavories(context);
      notifyListeners();
    }else{
      ApiChecker.checkApi( context,  response);
    }
  }


  void removeFavory(int boutiqueId, BuildContext context) async {
    final response = await boutiqueFavoriesRepo.removeFavories(boutiqueId);
    if(response.error == null){
      updateFavories(context);
      notifyListeners();
    }else{
      ApiChecker.checkApi( context,  response);
    }
  }


  bool isFavory(int boutiqueId) {
    return boutiquesFavories.any((element) => element.id == boutiqueId);
  }



  updateFavories(BuildContext context) async {
    getAllMyFavories(context);
  }




}