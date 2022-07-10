import 'package:flutter/material.dart';
import 'package:wantermarket/data/models/body/boutique.dart';

import '../data/models/body/product.dart';
import '../data/repositories/search_repo.dart';

class SearchProvider extends ChangeNotifier {
  final SearchRepo searchRepo;
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
    try{
      final response = await searchRepo.search(query);
      if(response.error == null ){
        response.response.data['data']['boutiques'].forEach((element) {
          boutiques.add(Boutique.fromJson(element));
        });
        response.response.data['data']['produits'].forEach((element) {
          products.add(Product.fromJson(element));
        });
        notifyListeners();
      }
    }catch(e){
      print(e);
    }
  }

}