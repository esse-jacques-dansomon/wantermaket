
import 'package:flutter/cupertino.dart';
import 'package:wantermarket/data/models/body/category.dart';

import '../data/repositories/categories_repo.dart';

class CategoryProvider extends ChangeNotifier{
  final CategoryRepo categoryRepo;
  CategoryProvider({required this.categoryRepo});

  final List<Category> _categories = [];
  List<Category> get categories => _categories;

  Future<void> getCategories() async {
    final response = await categoryRepo.getCategories();

    if(response.error == null){
      _categories.clear();
      response.response.data['data'].forEach((element) {
        _categories.add(Category.fromJson(element));
      });
      notifyListeners();
    }else{
      print('error');
    }
  }
}