import 'package:flutter/material.dart';

import '../data/models/body/boutique.dart';
import '../data/repositories/boutique_repo.dart';

class BoutiqueProvider extends ChangeNotifier{
  final BoutiqueRepo boutiqueRepo;
  BoutiqueProvider({required this.boutiqueRepo});

  final List<Boutique> _boutiquesExclusives = [];
  List<Boutique> get boutiquesExclusives => _boutiquesExclusives;

  Future<void> getBoutiquesExclusives() async {
    final response = await boutiqueRepo.getBoutiquesExclusives();

    if(response.error == null){
      _boutiquesExclusives.clear();
      response.response.data['data'].forEach((element) {
        _boutiquesExclusives.add(Boutique.fromJson(element));
      });
      notifyListeners();
    }else{
      print('error');
    }
  }

}