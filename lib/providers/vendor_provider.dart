import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wantermarket/data/models/body/vendor.dart';
import 'package:wantermarket/data/models/body/vendor_stat.dart';

import '../data/models/body/boutique.dart';
import '../data/models/body/product.dart';
import '../data/repositories/vendor_repo.dart';

class VendorProvider extends ChangeNotifier {
  final VendorRepo vendorRepo;
  final SharedPreferences sharedPreferences;

  VendorProvider( {required this.vendorRepo, required this.sharedPreferences});

  bool isLoaded= false;
  Boutique _boutique = Boutique();
  Boutique get boutique => _boutique;

  Vendor _vendor = Vendor();
  Vendor get vendor => _vendor;

  VendorStat _vendorStat = VendorStat();
  VendorStat get vendorStat => _vendorStat;

  final List<Product> _products = [] ;
  bool isProductsLoad = false;
  List<Product> get products => _products;





  Future<void> getBoutique() async {
    try {
      final response = await vendorRepo.getUserConnectedBoutique();
      _boutique = Boutique.fromJson(response.response.data['data']);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getVendorStat() async {
    notifyListeners();
    try {
      final response = await vendorRepo.getUserConnectedStat();
      _vendorStat = VendorStat.fromJson(response.response.data["data"]);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getVendorProducts() async {
    isProductsLoad = false;
    notifyListeners();
    try {
      final response = await vendorRepo.getUserConnectedProducts();
      _products.clear();
      response.response.data['data'].forEach((element) {
        _products.add(Product.fromJson(element));
      });
      isProductsLoad = true;
      notifyListeners();
    } catch (e) {
      rethrow;
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

  Future<void> incrementProductView(int idProduct) async {
    await vendorRepo.incrementProductView(idProduct);
    notifyListeners();
  }

  void clear() {
    products.clear();
    isProductsLoad = false;
    _vendor= Vendor();
    _vendorStat = VendorStat();
    _boutique = Boutique();
    ChangeNotifier();
  }



}