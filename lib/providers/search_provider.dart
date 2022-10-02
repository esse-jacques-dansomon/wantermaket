
import 'package:flutter/material.dart';
import 'package:wantermarket/data/models/body/boutique.dart';
import 'package:wantermarket/data/models/body/filter_model.dart';
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
enum searchPaginationState {
  loading,
  loaded,
  error,
}
class SearchProvider extends ChangeNotifier {
  final SearchRepo searchRepo;
  SearchProductState state = SearchProductState.initial;
  searchPaginationState paginationState = searchPaginationState.loaded;
  SearchBoutiqueState searchBoutiqueState = SearchBoutiqueState.initial;
  SearchProvider({required this.searchRepo});

  String? searchText = null;
  int page = 1;

  final List<Product> _products = [];
  List<Product> get products => _products;

  final List<Boutique> _boutiques = [];
  List<Boutique> get boutiques => _boutiques;


  Future<void> filter(BuildContext context,{required FilterModel filterModel, bool isNewSearch = true}) async {
    if(isNewSearch){
      products.clear();
      boutiques.clear();
      page = 1;
      state = SearchProductState.loading;
      searchBoutiqueState = SearchBoutiqueState.loading;
      notifyListeners();
    }else{
      paginationState = searchPaginationState.loading;
      notifyListeners();
    }


    final response = await searchRepo.search(filterModel: filterModel, page: page);
    if(response.response.statusCode == 200 ){
      if(response.response.data['produits'] != null && response.response.data['produits'] != []){
        response.response.data['produits']['data'].forEach((element) {
          products.add(Product.fromJson(element));
        });

        //CAN BE PAGINATED
        if(  (response.response.data['produits']['meta']).isNotEmpty &&
            response.response.data['produits']['meta']['links']['next'] !=null){
            page++;
        }else{
          page++;
          paginationState = searchPaginationState.loaded;
          notifyListeners();
        }

      }
      if(response.response.data['boutiques'] != null && response.response.data['boutiques'] != []){
        response.response.data['boutiques']['data'].forEach((element) {
          boutiques.add(Boutique.fromJson(element));
        });
      }

      //CHECK IF THERE IS NO PRODUCTS OR BOUTIQUES FOUND IN NEW SEARCH ONLY : NO NEED FOR PAGINATION
      if(isNewSearch){
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
      }else{
        this.paginationState = searchPaginationState.loaded;
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