
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wantermarket/data/models/body/boutique.dart';
import 'package:wantermarket/data/models/body/filter_model.dart';

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

  Future<void> search({required FilterModel filterModel}) async {
    searchText = filterModel.keyWorld;
    products.clear();
    boutiques.clear();
    state = SearchProductState.loading;
    searchBoutiqueState = SearchBoutiqueState.loading;
    notifyListeners();
    try{
       Response response = await searchRepo.search(filterModel: filterModel);
      if(response.statusCode == 200 ){
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
      }
    }catch(e){
      state = SearchProductState.error;
      searchBoutiqueState = SearchBoutiqueState.error;
      notifyListeners();
    }
  }

  Future<void> filter({required FilterModel filterModel}) async {
    products.clear();
    boutiques.clear();
    state = SearchProductState.loading;
    searchBoutiqueState = SearchBoutiqueState.loading;
    notifyListeners();
    try{
       var response = await searchRepo.searchPost(filterModel: filterModel);
       // print(response.response.data.toString());
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
        // print(response.statusCode);
        // print(response.realUri);
        // print(response.data);
        // print(response.requestOptions);
        // print(response.statusMessage);
        state = SearchProductState.error;
        searchBoutiqueState = SearchBoutiqueState.error;
        notifyListeners();
      }
    }catch(e){
      state = SearchProductState.error;
      searchBoutiqueState = SearchBoutiqueState.error;
      notifyListeners();
      print(e);
    }
  }

  // Future<void> filter(FilterModel filterModel) async {
  //
  // }

}