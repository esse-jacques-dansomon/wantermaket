import 'package:flutter/material.dart';
import 'package:wantermarket/data/models/body/boutique.dart';
import 'package:wantermarket/data/models/body/filter_model.dart';
import 'package:wantermarket/data/models/response/api_response.dart';

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

  String searchText = '';
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
       var response = await searchRepo.search(filterModel: filterModel);
      if(response.error == null ){
        response.response.data['data']['boutiques'].forEach((element) {
          boutiques.add(Boutique.fromJson(element));
        });
        response.response.data['data']['produits'].forEach((element) {
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
        print(response.response.statusCode);
        print(response.response.realUri);
        print(response.response.data);
        print(response.response.requestOptions);
        print(response.response.statusMessage);
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
  Future<void> filter({required FilterModel filterModel}) async {
    filterModel.keyWorld = searchText;
    products.clear();
    boutiques.clear();
    state = SearchProductState.loading;
    searchBoutiqueState = SearchBoutiqueState.loading;
    notifyListeners();
    try{
       var response = await searchRepo.search(filterModel: filterModel);
      if(response.error == null ){
        response.response.data['data']['boutiques'].forEach((element) {
          boutiques.add(Boutique.fromJson(element));
        });
        response.response.data['data']['produits'].forEach((element) {
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
        print(response.response.statusCode);
        print(response.response.realUri);
        print(response.response.data);
        print(response.response.requestOptions);
        print(response.response.statusMessage);
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