import 'dart:convert';

import 'package:dio/dio.dart';
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

  String searchText = ' ';
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
       print("fuckkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk bitchccccccccccccccccccccccccccccccccc");
      if(response.statusCode == 200 ){
        response.data['data']['boutiques'].forEach((element) {
          boutiques.add(Boutique.fromJson(element));
        });
        response.data['data']['produits'].forEach((element) {
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
        print(response.statusCode);
        print(response.realUri);
        print(response.data);
        print(response.requestOptions);
        print(response.statusMessage);
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
    filterModel.keyWorld = "";
    products.clear();
    boutiques.clear();
    state = SearchProductState.loading;
    searchBoutiqueState = SearchBoutiqueState.loading;
    notifyListeners();
    try{
       var response = await searchRepo.search(filterModel: filterModel);
      if(response.statusCode == 200){
        response.data['data']['boutiques'].forEach((element) {
         try{
           boutiques.add(Boutique.fromJson(element));
         }catch(e){
            print(e);
         }
        });
        response.data['data']['produits'].forEach((element) {
          try{
            products.add(Product.fromJson(element));
          }catch(e){
            print(e);
          }
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
        print(response.statusCode);
        print(response.realUri);
        print(response.data);
        print(response.requestOptions);
        print(response.statusMessage);
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