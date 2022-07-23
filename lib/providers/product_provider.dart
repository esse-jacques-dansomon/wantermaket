import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:wantermarket/data/repositories/product_repo.dart';
import 'package:wantermarket/shared/app_helper.dart';

import '../data/models/body/product.dart';

class ProductProvider extends ChangeNotifier{
  final ProductsRepo productsRepo;
  ProductProvider({required this.productsRepo});

  final List<Product> _topAnnonces = [];
  final List<Product> _dealsOfTheDay = [];
  final List<Product> _newArrivals = [];
  final List<Product> _relatedProducts = [];

  bool isPaginationLoading = false;
  String? nextPageLink;

  int _page = 1;
  int get page => _page;

  set page(int value) {
    _page = value;
    notifyListeners();
  }

  List<Product> get topAnnonces => _topAnnonces;
  List<Product> get dealsOfTheDay => _dealsOfTheDay;
  List<Product> get newArrivals => _newArrivals;
  List<Product> get relatedProducts => _relatedProducts;

  Future<void> getTopAnnonces() async {
    final topAnnoncesResponse = await productsRepo.getTopAnnonces();
    if(topAnnoncesResponse.error == null ){
      _topAnnonces.clear();
      topAnnoncesResponse.response.data['data'].forEach((element) {
        Product p = Product.fromJson(element);
        _topAnnonces.add(p);
      });
      notifyListeners();
    }
  }

  Future<void> getDealOfTheDay() async {
    final dealsOfTheDayResponse = await productsRepo.getDealsOfTheDay();
    if(dealsOfTheDayResponse.error == null ){
      _dealsOfTheDay.clear();
      dealsOfTheDayResponse.response.data['data'].forEach((element) {
        _dealsOfTheDay.add(Product.fromJson(element));
      });
      notifyListeners();
    }
  }

  Future<void> getNewArrivals({reload = false}) async {
    if(reload){
      _newArrivals.clear();
      _page = 1;
    }
    isPaginationLoading = true;
    notifyListeners();
    final newArrivalsResponse = await productsRepo.getNewProducts(page : page);
    if(newArrivalsResponse.error == null ){
      newArrivalsResponse.response.data['data'].forEach((element) {
        _newArrivals.add(Product.fromJson(element));
      });
      if(newArrivalsResponse.response.data['links']['next'] != null){
        page++;
      }
      isPaginationLoading = false;
      notifyListeners();
    }
  }




  Future<void> getRelatedProducts(int categoryId) async {
    final newArrivalsResponse = await productsRepo.getRelatedProducts(categoryId);
    if(newArrivalsResponse.error == null ){
      relatedProducts.clear();
      newArrivalsResponse.response.data['data'].forEach((element) {
        relatedProducts.add(Product.fromJson(element));
      });
      notifyListeners();
    }
  }






}