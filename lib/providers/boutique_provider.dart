import 'package:flutter/material.dart';
import 'package:wantermarket/data/models/body/product.dart';

import '../data/models/body/boutique.dart';
import '../data/repositories/boutique_repo.dart';

enum BoutiqueState { initial, loading, loaded, error }
enum TopBoutiqueState { initial, loading, loaded, error }

class BoutiqueProvider extends ChangeNotifier{
  final BoutiqueRepo boutiqueRepo;
  BoutiqueProvider({required this.boutiqueRepo});

  final List<Boutique> _topBoutiques = [];
  final List<Boutique> _exclusivesBoutiques = [];
  final List<Product> _boutiqueProduits = [];
  final List<Product> productsSearch = [];
  List<Product> get boutiqueProduits => _boutiqueProduits;
  List<Boutique> get topBoutiques => _topBoutiques;
  List<Boutique> get boutiquesExclusives => _exclusivesBoutiques;

  //states
  BoutiqueState state = BoutiqueState.initial;
  TopBoutiqueState topBoutiqueState = TopBoutiqueState.initial;

  Future<void> getTopBoutiques() async {
    this.topBoutiqueState = TopBoutiqueState.loading;
    notifyListeners();
    final response = await boutiqueRepo.getTopBoutiques();
    if( response.response.statusCode == 200){
      _topBoutiques.clear();
      response.response.data.forEach((element) {
        _topBoutiques.add(Boutique.fromJson(element));
      });
      this.topBoutiqueState = TopBoutiqueState.loaded;
      notifyListeners();
    }else{
      this.topBoutiqueState = TopBoutiqueState.error;
      notifyListeners();
    }
  }

  Future<void> getBoutiquesExclusives() async {
    this.state = BoutiqueState.loading;
    notifyListeners();
    final response = await boutiqueRepo.getBoutiquesExclusives();
    if(response.error == null && response.response.statusCode == 200){
      _exclusivesBoutiques.clear();
      response.response.data.forEach((element) {
        _exclusivesBoutiques.add(Boutique.fromJson(element));
      });
      this.state = BoutiqueState.loaded;
      notifyListeners();
    }else{
      this.state = BoutiqueState.error;
      notifyListeners();
    }
  }

  Future<void> getBoutiqueProduits(int boutiqueId) async {
    boutiqueProduits.clear();
    productsSearch.clear();
    notifyListeners();
    final response = await boutiqueRepo.getProductsByBoutique(boutiqueId);
    notifyListeners();
    if(response.error == null){
      response.response.data['data'].forEach((element) {
        boutiqueProduits.add(Product.fromJson(element));
      });
      productsSearch.addAll(boutiqueProduits) ;
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

  void searchProduct(String text) {
    productsSearch.clear();
    productsSearch.addAll(
      boutiqueProduits.where((element) => element.name!.toLowerCase().contains(text.toLowerCase())).toList()
    );
    notifyListeners();
  }

}