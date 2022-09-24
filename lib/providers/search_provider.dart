
import 'package:flutter/material.dart';
import 'package:wantermarket/data/models/body/boutique.dart';
import 'package:wantermarket/data/models/body/filter_model.dart';
import 'package:wantermarket/data/models/response/api_response.dart';
import 'package:wantermarket/shared/api_checker.dart';

import '../data/models/body/product.dart';
import '../data/repositories/search_repo.dart';

enum SearchProductState {
  initial,
  loading,
  loaded,
  noProducts,
  error,
}
enum SearchBoutiqueState {
  initial,
  loading,
  loaded,
  noProducts,
  error,
}
class SearchProvider extends ChangeNotifier {
  final SearchRepo searchRepo;
  SearchProductState state = SearchProductState.initial;
  SearchBoutiqueState searchBoutiqueState = SearchBoutiqueState.initial;
  SearchProvider({required this.searchRepo});

  String? searchText = null;
  final List<Product> _products = [];
  List<Product> get products => _products;

  final List<Boutique> _boutiques = [];
  List<Boutique> get boutiques => _boutiques;

  Future<void> search(BuildContext context, {required FilterModel filterModel}) async {
    searchText = filterModel.keyWorld;
    products.clear();
    boutiques.clear();
    state = SearchProductState.loading;
    searchBoutiqueState = SearchBoutiqueState.loading;
    notifyListeners();
    ApiResponse responseB =  await searchRepo.search(filterModel: filterModel);
    final response = responseB.response;
    if(response.statusCode == 200 ){
      print(response.data);
      response.data['boutiques'].forEach((element) {
        boutiques.add(Boutique.fromJson(element));
      });
      response.data['produits'].forEach((element) {
        products.add(Product.fromJson(element));
      });
      if(products.isEmpty){
        state = SearchProductState.noProducts;
      }else{
        state = SearchProductState.loaded;
      }
      if(boutiques.isEmpty){
        searchBoutiqueState = SearchBoutiqueState.noProducts;
      }else{
        searchBoutiqueState = SearchBoutiqueState.loaded;
      }
      notifyListeners();
    }else{
      state = SearchProductState.error;
      searchBoutiqueState = SearchBoutiqueState.error;
      notifyListeners();
      ApiChecker.checkApi(context, responseB);
    }

  }

  Future<void> filter(BuildContext context, {required FilterModel filterModel}) async {
    products.clear();
    boutiques.clear();
    state = SearchProductState.loading;
    searchBoutiqueState = SearchBoutiqueState.loading;
    notifyListeners();
    final response = await searchRepo.searchPost(filterModel: filterModel);
    if(response.response.statusCode == 200 ){
      if(response.response.data['boutiques'] != null){
        response.response.data['boutiques'].forEach((element) {
          boutiques.add(Boutique.fromJson(element));
        });
      }
      if(response.response.data['produits'] != null){
        response.response.data['produits'].forEach((element) {
          products.add(Product.fromJson(element));
        });
      }
      if(products.isEmpty){
        state = SearchProductState.noProducts;
      }else{
        state = SearchProductState.loaded;
      }
      if(boutiques.isEmpty){
        searchBoutiqueState = SearchBoutiqueState.noProducts;
      }else{
        searchBoutiqueState = SearchBoutiqueState.loaded;
      }
      notifyListeners();
    }else{
      state = SearchProductState.error;
      searchBoutiqueState = SearchBoutiqueState.error;
      notifyListeners();
      ApiChecker.checkApi(context, response);
    }
  }

}