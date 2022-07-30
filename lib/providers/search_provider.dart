import 'package:flutter/material.dart';
import 'package:wantermarket/data/models/body/boutique.dart';

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

  Future<void> search(String query) async {
    products.clear();
    boutiques.clear();
    searchText= query;
    state = SearchProductState.loading;
    searchBoutiqueState = SearchBoutiqueState.loading;
    notifyListeners();
    try{
      final response = await searchRepo.search(query);
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
      }
    }catch(e){
      state = SearchProductState.error;
      searchBoutiqueState = SearchBoutiqueState.error;
      notifyListeners();
      print(e);
    }
  }

  Future<void> filter()async {

  }

}