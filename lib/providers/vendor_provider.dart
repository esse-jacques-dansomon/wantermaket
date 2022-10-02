import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wantermarket/data/models/body/boutique_update_model.dart';
import 'package:wantermarket/data/models/body/vendor.dart';
import 'package:wantermarket/data/models/body/vendor_stat.dart';
import 'package:wantermarket/shared/api_checker.dart';

import '../data/models/body/boutique.dart';
import '../data/models/body/product.dart';
import '../data/repositories/vendor_repo.dart';

enum ProfilePaginationState { loading, loaded, error, noMoreData }
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

  String nextProductsUrl = "";
  ProfilePaginationState _profileProductsPaginateState = ProfilePaginationState.loading;
    ProfilePaginationState get profileProductsPaginateState => _profileProductsPaginateState;


  Future<void> getBoutique(BuildContext context) async {
    final response = await vendorRepo.getUserConnectedBoutique();
    if(response.response.statusCode == 200){
      _boutique = Boutique.fromJson(response.response.data);
    }else{
      ApiChecker.checkApi(context, response);
    }
  }

  Future<void> getVendorStat(BuildContext context) async {
    final response =  await vendorRepo.getUserConnectedStat();
    if(response.response.statusCode == 200){
      _vendorStat = VendorStat.fromJson(response.response.data);
      notifyListeners();
    }else{
      ApiChecker.checkApi(context, response);
    }
  }

  Future<void> getVendorProducts(BuildContext context, {reload = true}) async {
    if(reload){
      isProductsLoad = false;
    }
    _products.clear();
    this._profileProductsPaginateState = ProfilePaginationState.loaded;
    notifyListeners();
    final response = await vendorRepo.getUserConnectedProducts();
    if(response.response.statusCode == 200){
      response.response.data['data'].forEach((element) {
        _products.add(Product.fromJson(element));
      });
      if(response.response.data['meta']['links']['next'] != null){
        nextProductsUrl = response.response.data['meta']['links']['next'];
        _profileProductsPaginateState = ProfilePaginationState.loaded;
      }else{
        _profileProductsPaginateState = ProfilePaginationState.noMoreData;
      }
    }else{
      ApiChecker.checkApi(context, response);
    }
    if(reload){
      isProductsLoad = true;
    }
    notifyListeners();
  }

  Future<void> getVendorPaginateProducts() async {
    if(_profileProductsPaginateState == ProfilePaginationState.loading || _profileProductsPaginateState == ProfilePaginationState.noMoreData){
      return Future.value();
    }
    _profileProductsPaginateState = ProfilePaginationState.loading;
    notifyListeners();
    return vendorRepo.getUserConnectedPaginatedProducts(nextProductsUrl).then((value) {
      if(value.response.data != null){
        value.response.data['data'].forEach((element) {
          _products.add(Product.fromJson(element));
        });
        if(value.response.data['meta']['links']['next'] != null){
          nextProductsUrl = value.response.data['meta']['links']['next'];
          _profileProductsPaginateState = ProfilePaginationState.loaded;
        }else{
          _profileProductsPaginateState = ProfilePaginationState.noMoreData;
        }
      }else{
        _profileProductsPaginateState = ProfilePaginationState.error;
      }
      notifyListeners();
    }).catchError((e){
      _profileProductsPaginateState = ProfilePaginationState.error;
      notifyListeners();
    });
  }

  Future<bool> updateBoutique(BuildContext context, BoutiqueUpdateModel boutiqueUpdateModel, {File? filePhotoProfile, File? filePhotoCover}) async {
    this.isUpdateBoutiqueLoading = true;
    notifyListeners();
    FormData data = FormData.fromMap(boutiqueUpdateModel.toJson(), ListFormat.multiCompatible);
    if(filePhotoProfile != null){
      data.files.add(MapEntry('profil_image', await MultipartFile.fromFile(filePhotoProfile.path, filename: filePhotoProfile.path.split('/').last)));
      if(filePhotoCover != null){
        data.files.add(MapEntry('cover_image', await MultipartFile.fromFile(filePhotoCover.path, filename: filePhotoCover.path.split('/').last)));
      }
    }
    var reponse = await vendorRepo.updateBoutique(data);
    if(reponse.response.statusCode == 200){
      getBoutique(context);
      this.isUpdateBoutiqueLoading = false;
      notifyListeners();
      return true;
    }else{
      this.isUpdateBoutiqueLoading = false;
      notifyListeners();
      ApiChecker.checkApi(context, reponse);
      return false;

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