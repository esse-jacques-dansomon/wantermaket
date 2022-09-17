import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/data/repositories/boutique_favories_repo.dart';
import 'package:wantermarket/providers/vendor_provider.dart';

import '../data/models/body/boutique.dart';
import 'auth_provider.dart';

class BoutiqueFavoriesProvider extends ChangeNotifier{
  final BoutiqueFavoriesRepo boutiqueFavoriesRepo;

  BoutiqueFavoriesProvider({required this.boutiqueFavoriesRepo});

  final List<Boutique> _boutiquesFavories = [];
  List<Boutique> get boutiquesFavories => _boutiquesFavories;

  void getAllMyFavories() async {
    boutiquesFavories.clear();
    final response = await boutiqueFavoriesRepo.getMyFavories();
    if(response.error == null){
      response.response.data.forEach((element) {
        boutiquesFavories.add(Boutique.fromJson(element));
      });
      notifyListeners();
    }else{
      print('error');
    }
    notifyListeners();
  }

  void addFavory(int boutiqueId) async {
    final response = await boutiqueFavoriesRepo.addFavories(boutiqueId);
    if(response.error == null){
      updateFavories();
      notifyListeners();
    }else{
      print('error');
    }
    notifyListeners();
  }


  void removeFavory(int boutiqueId) async {
    final response = await boutiqueFavoriesRepo.removeFavories(boutiqueId);
    if(response.error == null){
      updateFavories();
      notifyListeners();
    }else{
      print('error');
    }
    notifyListeners();
  }


  bool isFavory(int boutiqueId) {
    return boutiquesFavories.any((element) => element.id == boutiqueId);
  }



  updateFavories() async {
    getAllMyFavories();
  }




}