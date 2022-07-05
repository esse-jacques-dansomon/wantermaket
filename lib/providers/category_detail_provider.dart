
import 'package:flutter/cupertino.dart';
import 'package:wantermarket/data/models/body/category.dart';
import 'package:wantermarket/data/models/body/product.dart';
import 'package:wantermarket/data/models/body/subCategory.dart';

import '../data/repositories/categories_repo.dart';

class CategoryProviderDetails extends ChangeNotifier{
  final CategoryRepo categoryRepo;
  CategoryProviderDetails({required this.categoryRepo});

  final List<SousCategorie> _souscategories = [];
  final List<Product> _products = [];


  List<Product> get products => _products;
  List<SousCategorie> get souscategories => _souscategories;

  Future<void> getCategoryProducts(int id) async {
    final response = await categoryRepo.getCategoryProducts(id);
    if(response.error == null){
      _products.clear();
      response.response.data['data'].forEach((element) {
        _products.add(Product.fromJson(element));
      });
      notifyListeners();
    }else{
      print('error');
    }
  }

  Future<void> getSubCategoryProducts(int id) async {
    final response = await categoryRepo.getSubCategoryProducts(id);
    if(response.error == null){
      _products.clear();
      response.response.data['data'].forEach((element) {
        _products.add(Product.fromJson(element));
      });
      notifyListeners();
    }else{
      print('error');
    }
  }

  Future<void> getSubCategoriesOfCategory(int id) async {
    final response = await categoryRepo.getSubCategoriesOfCategory(id);
    if(response.error == null){
      _souscategories.clear();
      response.response.data['data'].forEach((element) {
        _souscategories.add(SousCategorie.fromJson(element));
      });
      notifyListeners();
    }else{
      print('error');
    }
  }



}