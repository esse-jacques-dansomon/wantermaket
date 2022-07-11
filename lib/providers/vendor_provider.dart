import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wantermarket/data/models/body/vendor.dart';
import 'package:wantermarket/data/models/body/vendor_stat.dart';

import '../config/app_constantes.dart';
import '../data/models/body/boutique.dart';
import '../data/models/body/product.dart';
import '../data/repositories/vendor_repo.dart';

class VendorProvider extends ChangeNotifier {
  final VendorRepo vendorRepo;
  final SharedPreferences sharedPreferences;

  VendorProvider( {required this.vendorRepo, required this.sharedPreferences});

  Boutique _boutique = Boutique();
  Boutique get boutique => _boutique;

  Vendor _vendor = Vendor();
  Vendor get vendor => _vendor;

  VendorStat _vendorStat = VendorStat();
  VendorStat get vendorStat => _vendorStat;

  final List<Product> _products = []  ;
  bool isProudctLoad = false;
  List<Product> get products => _products;

  String get boutqueId => sharedPreferences.getString(AppConstants.BOUTIQUE_ID) ?? '53';




  Future<void> getBoutique(int idBoutique) async {
    print('getBoutique ${sharedPreferences.getString(AppConstants.BOUTIQUE_ID) }');
    try {
      final response = await vendorRepo.getBoutiqueById(idBoutique);
      _boutique = Boutique.fromJson(response.response.data['data']);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> getVendorStat(int idBoutique) async {
    print('voir stat');
    notifyListeners();
    try {
      final response = await vendorRepo.getVendorStat(idBoutique);
      print(response.data);
      _vendorStat = VendorStat.fromJson(response.data["data"]);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getVendorProducts(int idBoutique) async {
    notifyListeners();

    try {
      final response = await vendorRepo.getProductsByBoutique(idBoutique);
      _products.clear();
      response.response.data['data'].forEach((element) {
        _products.add(Product.fromJson(element));
      });
      isProudctLoad = true;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  void changeDisponibilityProduct(int productId) {
    for (var element in _products) {
      if (element.id == productId) {
        element.disponibility == 'oui' ? element.disponibility = 'non' : element.disponibility = 'oui';
      }
    }
    notifyListeners();
  }

  void clear() {
    products.clear();
    isProudctLoad = false;
    _vendor= Vendor();
    _vendorStat = VendorStat();
    _boutique = Boutique();
    ChangeNotifier();
  }



}