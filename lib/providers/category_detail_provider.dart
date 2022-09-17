
import 'package:flutter/cupertino.dart';
import 'package:wantermarket/data/models/body/category.dart';
import 'package:wantermarket/data/models/body/product.dart';
import 'package:wantermarket/data/models/body/subCategory.dart';

import '../data/repositories/categories_repo.dart';

enum DataState {
  initial,
  loading,
  loadingPagination,
  loaded,
  noMoreData,
  error,
}
class CategoryProviderDetails extends ChangeNotifier{
  final CategoryRepo categoryRepo;
  CategoryProviderDetails({required this.categoryRepo});

  final List<SousCategorie> _souscategories = [];
  final List<Product> _products = [];
  bool isLoading = false;
  bool isLoadingPagination = false;
  bool noMoreData = false;
  DataState _dataState = DataState.initial;
  DataState get dataState => _dataState;
  int selectedSubCategory = 0;
  int currentPage = 1;


  List<Product> get products => _products;
  List<SousCategorie> get souscategories => _souscategories;


  void controlPagination(isPagination, {int subCategoryId = 0}) {
    selectedSubCategory = subCategoryId;
    if(isPagination){
      currentPage++;
      _dataState = DataState.loadingPagination;
      notifyListeners();
    }else{
      currentPage = 1;
      _dataState = DataState.loading;
      _products.clear();
      notifyListeners();
    }

  }
  Future<void> getCategoryProducts(int id,{isPagination = false} ) async {
    controlPagination(isPagination);
    final response = await categoryRepo.getCategoryProducts(id, currentPage);
    if(response.response.statusCode == 200){
      if(response.response.data['data'].length == 0 && currentPage == 1){
        _dataState = DataState.noMoreData;
      }else{
        response.response.data['data'].forEach((element) {
          _products.add(Product.fromJson(element));
        });
        _dataState = DataState.loaded;
      }
    }else{
      _dataState = DataState.error;
    }
    notifyListeners();

  }

  Future<void> getSubCategoryProducts(int id, {isPagination = false}) async {
    controlPagination(isPagination, subCategoryId: id);
    try{
      final response = await categoryRepo.getSubCategoryProducts(id, currentPage);
      if(response.error == null){
        if(response.response.data['data'].length == 0 && currentPage == 1){
          _dataState = DataState.noMoreData;
        }else{
          response.response.data['data'].forEach((element) {
            _products.add(Product.fromJson(element));
          });
          _dataState = DataState.loaded;
        }
      }
      notifyListeners();
    }catch(e){
      _dataState = DataState.error;
      notifyListeners();


    }

  }

  Future<void> getSubCategoriesOfCategory(int id) async {
    final response = await categoryRepo.getSubCategoriesOfCategory(id);
    if(response.error == null){
      _souscategories.clear();
      response.response.data.forEach((element) {
        _souscategories.add(SousCategorie.fromJson(element));
      });
      notifyListeners();
    }else{
      print('error');
    }
  }

  Future<List<SousCategorie>> getSubCategoriesOfCategoryDp(int id, List<SousCategorie> sousCategories) async {
    final response = await categoryRepo.getSubCategoriesOfCategory(id);
    if(response.error == null){
      sousCategories.clear();
      response.response.data.forEach((element) {
        sousCategories.add(SousCategorie.fromJson(element));
      });
      return sousCategories;
    }else{
      return sousCategories;
    }
  }






}