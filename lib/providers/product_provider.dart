
import 'package:flutter/material.dart';
import 'package:wantermarket/data/repositories/product_repo.dart';
import 'package:wantermarket/shared/api_checker.dart';
import '../data/models/body/product.dart';

enum ProductTopAnnoncesStatus { initial, loading, loaded, error }
enum ProductDealOfTheDayStatus { initial, loading, loaded, error }
enum ProductNewArrivalStatus { initial, loading, loaded, error }

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
  //status
  ProductTopAnnoncesStatus topAnnoncesStatus = ProductTopAnnoncesStatus.initial;
  ProductDealOfTheDayStatus dealsOfTheDayStatus = ProductDealOfTheDayStatus.initial;
  ProductNewArrivalStatus newArrivalStatus = ProductNewArrivalStatus.initial;


  //set status
  set setTopAnnoncesState(ProductTopAnnoncesStatus value) {
    topAnnoncesStatus = value;
    notifyListeners();
  }

  set setDealsOfTheDayState(ProductDealOfTheDayStatus value) {
    dealsOfTheDayStatus = value;
  }

  Future<void> getTopAnnonces(BuildContext context) async {
    setTopAnnoncesState = ProductTopAnnoncesStatus.loading;
    notifyListeners();
    final topAnnoncesResponse = await productsRepo.getTopAnnonces();
    if(topAnnoncesResponse.response.statusCode == 200 ){
      _topAnnonces.clear();
      topAnnoncesResponse.response.data['data'].forEach((element) {
        Product p = Product.fromJson(element);
        _topAnnonces.add(p);
      });
      setTopAnnoncesState = ProductTopAnnoncesStatus.loaded;
      notifyListeners();

    }else{
      setTopAnnoncesState = ProductTopAnnoncesStatus.error;
      notifyListeners();
      ApiChecker.checkApi(context, topAnnoncesResponse);
    }
  }

  Future<void> getDealOfTheDay(BuildContext context) async {
    setDealsOfTheDayState = ProductDealOfTheDayStatus.loading;
    notifyListeners();
    final dealsOfTheDayResponse = await productsRepo.getDealsOfTheDay();
    if(dealsOfTheDayResponse.response.statusCode == 200 ){
      _dealsOfTheDay.clear();
      dealsOfTheDayResponse.response.data['data'].forEach((element) {
        _dealsOfTheDay.add(Product.fromJson(element));
      });
      setDealsOfTheDayState = ProductDealOfTheDayStatus.loaded;
      notifyListeners();

    }else{
      setDealsOfTheDayState = ProductDealOfTheDayStatus.error;
      notifyListeners();
      ApiChecker.checkApi(context, dealsOfTheDayResponse);
    }
  }

  Future<void> getNewArrivals(BuildContext context, {reload = false}) async {
    if(reload){
      _newArrivals.clear();
      _page = 1;
      isPaginationLoading = false;
    }
    newArrivalStatus = ProductNewArrivalStatus.loading;
    notifyListeners();
    final newArrivalsResponse = await productsRepo.getNewProducts(page : page);
    if(newArrivalsResponse.response.statusCode == 200 ){
      newArrivalsResponse.response.data['data'].forEach((element) {
        _newArrivals.add(Product.fromJson(element));
      });
      if(newArrivalsResponse.response.data['meta']['links']['next'] != null){
        page++;
        isPaginationLoading = true;
      }else{
        page++;
        isPaginationLoading = false;
      }
      newArrivalStatus = ProductNewArrivalStatus.loaded;
      notifyListeners();
    }else{
      isPaginationLoading = false;
      newArrivalStatus = ProductNewArrivalStatus.error;
      notifyListeners();
      ApiChecker.checkApi(context, newArrivalsResponse);
    }
  }


  Future<void> getRelatedProducts(BuildContext context, int categoryId, int productId) async {
    final newArrivalsResponse = await productsRepo.getRelatedProducts(categoryId);
    if(newArrivalsResponse.error == null ){
      relatedProducts.clear();
      newArrivalsResponse.response.data['data'].forEach((element) {
        if(element['id'] != productId){
          relatedProducts.add(Product.fromJson(element));
        }
      });
      notifyListeners();
    }else{
      ApiChecker.checkApi(context, newArrivalsResponse);
    }
  }






}