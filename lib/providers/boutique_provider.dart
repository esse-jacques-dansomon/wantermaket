import 'package:flutter/material.dart';
import 'package:wantermarket/data/models/body/product.dart';
import 'package:wantermarket/shared/api_checker.dart';

import '../data/models/body/boutique.dart';
import '../data/repositories/boutique_repo.dart';

enum BoutiqueState { initial, loading, loaded, error }
enum TopBoutiqueState { initial, loading, loaded, error }
enum BoutiqueProduitsState { initial, loading, loaded, error }
enum PaginationState { loading, loaded, noMoreData }

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
  int page  = 1;
  int totalBoutiqueProducts = 0;

  //states
  BoutiqueState state = BoutiqueState.initial;
  TopBoutiqueState topBoutiqueState = TopBoutiqueState.initial;
  BoutiqueProduitsState boutiqueProduitsState = BoutiqueProduitsState.initial;
  PaginationState paginationState = PaginationState.loaded;

  Future<void> getTopBoutiques(BuildContext context) async {
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
      ApiChecker.checkApi( context, response);

    }
  }

  Future<void> getBoutiquesExclusives(BuildContext context) async {
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
      ApiChecker.checkApi( context, response);
    }
  }

  Future<void> getBoutiqueProduits(BuildContext context, int boutiqueId, {bool reload = true}) async {
    if(reload){
      boutiqueProduits.clear();
      productsSearch.clear();
      this.boutiqueProduitsState = BoutiqueProduitsState.loading;
      page = 1;
    }else{
      paginationState = PaginationState.loading;
    }
    notifyListeners();

    final response = await boutiqueRepo.getProductsByBoutique(boutiqueId, page: page);

    if(response.response.statusCode == 200){
      response.response.data['data'].forEach((element) {
        boutiqueProduits.add(Product.fromJson(element));
        productsSearch.add(Product.fromJson(element));
      });

      //VERIFIER SI LA PAGE EST LA DERNIERE
      if((response.response.data['meta']).isNotEmpty &&
          response.response.data['meta']['links']['next'] !=null) {
        page++;
      }else{
        page++;
        paginationState = PaginationState.loaded;
        notifyListeners();
      }
      if(reload){
        this.totalBoutiqueProducts = response.response.data['meta']['total'];
        this.boutiqueProduitsState = BoutiqueProduitsState.loaded;
      }else{
        paginationState = PaginationState.loaded;
      }
      notifyListeners();
    }else{
      this.boutiqueProduitsState = BoutiqueProduitsState.error;
      notifyListeners();
      ApiChecker.checkApi( context, response);
    }
  }

  Future<void> upgradeViewBoutique(BuildContext context, int boutiqueId) async {
    //is note the connected user shop
    final response = await boutiqueRepo.updateBoutiqueViews(boutiqueId);
    if(response.error == null){
    }else{
      ApiChecker.checkApi( context, response);
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