import 'package:flutter/cupertino.dart';
import 'package:wantermarket/data/models/body/vendor.dart';
import 'package:wantermarket/data/models/body/vendor_stat.dart';

import '../data/models/body/boutique.dart';
import '../data/models/body/product.dart';
import '../data/repositories/vendor_repo.dart';

class VendorProvider extends ChangeNotifier {
  final VendorRepo vendorRepo;
  VendorProvider({required this.vendorRepo });

  Boutique _boutique = Boutique();
  Boutique get boutique => _boutique;

  Vendor _vendor = Vendor();
  Vendor get vendor => _vendor;

  VendorStat _vendorStat = VendorStat();
  VendorStat get vendorStat => _vendorStat;

  final List<Product> _products = [];
  List<Product> get products => _products;


  Future<void> getVendor(int vendorId) async {
    try {
      final response = await vendorRepo.getVendorId(vendorId);
      _vendor = Vendor.fromJson(response.response.data);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getBoutique(int boutiqueId) async {
    try {
      final response = await vendorRepo.getBoutiqueById(boutiqueId);
      _boutique = Boutique.fromJson(response.response.data['data']);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> getVendorStat(int boutiqueId) async {
    print('voir stat');
    try {
      final response = await vendorRepo.getVendorStat(boutiqueId);
      print(response.data);
      _vendorStat = VendorStat.fromJson(response.data["data"]);
      notifyListeners();
    } catch (e) {
      rethrow;

    }
  }

  Future<void> getVendorProducts(int boutiqueId) async {
    try {
      final response = await vendorRepo.getProductsByBoutique(boutiqueId);
      _products.clear();
      response.response.data['data'].forEach((element) {
        _products.add(Product.fromJson(element));
      });
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  void changeDisponibilityProduct(int productId) {
    _products.forEach((element) {
      if (element.id == productId) {
        element.disponibility == 'oui' ? element.disponibility = 'non' : element.disponibility = 'oui';
      }
    });
    notifyListeners();
  }



}