import 'package:flutter/material.dart';
import 'package:wantermarket/data/models/body/product.dart';

import '../data/models/body/boutique.dart';
import '../data/repositories/boutique_repo.dart';

class BoutiqueProvider extends ChangeNotifier{
  final BoutiqueRepo boutiqueRepo;
  BoutiqueProvider({required this.boutiqueRepo});

  final List<Boutique> _boutiquesExclusives = [];
  final List<Product> _boutiqueProduits = [];
  List<Product> get boutiqueProduits => _boutiqueProduits;
  List<Boutique> get boutiquesExclusives => _boutiquesExclusives;

  Future<void> getBoutiquesExclusives() async {
    final response = await boutiqueRepo.getBoutiquesExclusives();
    if(response.error == null){
      _boutiquesExclusives.clear();
      response.response.data['data'].forEach((element) {
        _boutiquesExclusives.add(Boutique.fromJson(element));
      });
      notifyListeners();
    }else{
      print('error');
    }
  }


  Future<void> getBoutiqueProduits(int boutiqueId) async {
    final response = await boutiqueRepo.getProductsByBoutique(boutiqueId);
    boutiqueProduits.clear();

    if(response.error == null){
      response.response.data['data'].forEach((element) {
        boutiqueProduits.add(Product.fromJson(element));
      });
      notifyListeners();
    }else{
      print('error');
    }
  }

  Future<void> upgradeViewBoutique(int boutiqueId) async {
    //is note the connected user shop
    final response = await boutiqueRepo.updateBoutiqueViews(boutiqueId);
    if(response.error == null){
    }else{
      print('error');
    }
  }

}