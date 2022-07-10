
import 'package:flutter/cupertino.dart';
import 'package:wantermarket/data/models/body/boutique.dart';
import 'package:wantermarket/data/models/body/category.dart';

import '../data/repositories/categories_repo.dart';

class CategoryProvider extends ChangeNotifier{
  final CategoryRepo categoryRepo;
  CategoryProvider({required this.categoryRepo});

  final List<Category> _categories = [];
  final List<Boutique> _boutiques = [];

  List<Category> get categories => _categories;
  List<Boutique> get boutiques => _boutiques;

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

  Future<void> getBoutiquesBySector(int id) async {
    boutiques.clear();
    final response = await categoryRepo.getCategoryBoutiques(id);
    if(response.error == null){
      response.response.data['data'].forEach((element) {
        boutiques.add(Boutique.fromJson(element));
      });
      notifyListeners();
    }else{
      print('error ${response.error}');
    }
  }


}