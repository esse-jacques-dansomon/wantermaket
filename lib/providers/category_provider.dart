
import 'package:flutter/cupertino.dart';
import 'package:wantermarket/data/models/body/boutique.dart';
import 'package:wantermarket/data/models/body/category.dart';

import '../data/repositories/categories_repo.dart';

enum CategoryState { initial, loading, loaded, error }
class CategoryProvider extends ChangeNotifier{
  final CategoryRepo categoryRepo;
  CategoryProvider({required this.categoryRepo});

  final List<Category> _categories = [];
  final List<Boutique> _boutiques = [];

  List<Category> get categories => _categories;
  List<Boutique> get boutiques => _boutiques;

  //states
  CategoryState categoryState = CategoryState.initial;

  set categoryStatus(CategoryState value) {
    categoryState = value;
  }

  Future<void> getCategories() async {
    categoryStatus = CategoryState.loading;
    notifyListeners();
    final response = await categoryRepo.getCategories();
    if(response.response.statusCode == 200 ){
      _categories.clear();
      response.response.data.forEach((element) {
        _categories.add(Category.fromJson(element));
      });
      categoryStatus = CategoryState.loaded;
      notifyListeners();

    }else{
      categoryStatus = CategoryState.error;
      notifyListeners();
    }
  }

  Future<void> getBoutiquesBySector(int id) async {
    boutiques.clear();
    final response = await categoryRepo.getCategoryBoutiques(id);
    if(response.response.statusCode == 200 ){
      response.response.data['data'].forEach((element) {
        boutiques.add(Boutique.fromJson(element));
      });
      notifyListeners();
    }else{
      print('error ${response.error}');
    }
  }


}