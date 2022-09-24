
// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:wantermarket/data/models/body/category.dart';
import 'package:wantermarket/data/models/body/product.dart';
import 'package:wantermarket/data/models/body/subCategory.dart';
import 'package:wantermarket/shared/api_checker.dart';

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

  Future<void> getCategoryProducts( BuildContext context, int id,{isPagination = false} ) async {
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
      ApiChecker.checkApi(context, response);
    }
    notifyListeners();

  }

  Future<void> getSubCategoryProducts(BuildContext context,int id, {isPagination = false}) async {
    controlPagination(isPagination, subCategoryId: id);
    try{
      final response = await categoryRepo.getSubCategoryProducts(id, currentPage);
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
        ApiChecker.checkApi(context, response);
        _dataState = DataState.error;
      }
      notifyListeners();
    }catch(e){
      _dataState = DataState.error;
      notifyListeners();

    }

  }

  Future<void> getSubCategoriesOfCategory(BuildContext context, int id) async {
    final response = await categoryRepo.getSubCategoriesOfCategory(id);
    if(response.response.statusCode == 200){
      _souscategories.clear();
      response.response.data.forEach((element) {
        _souscategories.add(SousCategorie.fromJson(element));
      });
      notifyListeners();
    }else{
      ApiChecker.checkApi(context, response);
    }
  }

  Future<List<SousCategorie>> getSubCategoriesOfCategoryDp(BuildContext context,int id, List<SousCategorie> sousCategories) async {
    final response = await categoryRepo.getSubCategoriesOfCategory(id);
    if(response.response.statusCode == 200){
      sousCategories.clear();
      response.response.data.forEach((element) {
        sousCategories.add(SousCategorie.fromJson(element));
      });
      return sousCategories;
    }else{
      ApiChecker.checkApi(context, response);
      return [];
    }
  }

}