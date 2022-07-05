import 'package:flutter/foundation.dart';
import 'package:wantermarket/data/repositories/product_repo.dart';

import '../data/models/body/product.dart';

class ProductProvider extends ChangeNotifier{
  final ProductsRepo productsRepo;
  ProductProvider({required this.productsRepo});

  List<Product> _topAnnonces = [];
  List<Product> _dealsOfTheDay = [];
  List<Product> _newArrivals = [];
  int nextPage = 1;

  List<Product> get topAnnonces => _topAnnonces;
  List<Product> get dealsOfTheDay => _dealsOfTheDay;
  List<Product> get newArrivals => _newArrivals;

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
      dealsOfTheDayResponse.response.data['data'].forEach((element) {
        _dealsOfTheDay.add(Product.fromJson(element));
      });
      notifyListeners();
    }
  }

  Future<void> getNewArrivals() async {
    final newArrivalsResponse = await productsRepo.getNewProducts();
    if(newArrivalsResponse.error == null ){
      _newArrivals.clear();
      newArrivalsResponse.response.data['data'].forEach((element) {
        _newArrivals.add(Product.fromJson(element));
      });
      notifyListeners();
    }
  }


}