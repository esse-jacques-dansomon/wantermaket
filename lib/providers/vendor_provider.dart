import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wantermarket/data/models/body/boutique_update_model.dart';
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
  bool isUpdateBoutiqueLoading= false;

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

  Future<void> getVendorProducts({reload = true}) async {
    if(reload){
      isProductsLoad = false;
    }
    _products.clear();
    notifyListeners();
    try {
      final response = await vendorRepo.getUserConnectedProducts();
      response.response.data['data'].forEach((element) {
        _products.add(Product.fromJson(element));
      });
      if(reload){
        isProductsLoad = true;
      }
      notifyListeners();
    } catch (e) {
      if(reload){
        isProductsLoad = true;
      }
      notifyListeners();
      rethrow;
    }
  }

  Future<bool> updateBoutique(BoutiqueUpdateModel boutiqueUpdateModel, List<File> files) async {
    this.isUpdateBoutiqueLoading = true;
    notifyListeners();
    FormData data = FormData.fromMap(boutiqueUpdateModel.toJson(), ListFormat.multiCompatible);
    try{
      if(files.isNotEmpty){
        data.files.add(MapEntry('profil_image', await MultipartFile.fromFile(files[0].path, filename: files[0].path.split('/').last)));
        if(files.length> 1){
          data.files.add(MapEntry('cover_image', await MultipartFile.fromFile(files[1].path, filename: files[1].path.split('/').last)));
        }
      }
      var reponse = await vendorRepo.updateBoutique(data);
      if(reponse.error == null){
        getBoutique();
        this.isUpdateBoutiqueLoading = false;
        notifyListeners();
        return true;
      }else{
        this.isUpdateBoutiqueLoading = false;
        notifyListeners();
        throw Exception("Erreur lors de la mise à jour de la boutique");
      }
    }catch(e){
      this.isUpdateBoutiqueLoading = false;
      notifyListeners();
      throw Exception("Erreur lors de la mise à jour de la boutique");
    }

  }

  void changeDisponibilityProduct(int productId, BuildContext context) {
    for (var element in products) {
      if (element.id == productId) {
        element.disponibility == 'oui' ? element.disponibility = 'oui' : element.disponibility = 'non';
        notifyListeners();
        break;
      }
    }
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

  deleteProduct(int i) {
    products.removeWhere((element) => element.id == i);
    notifyListeners();
  }




}