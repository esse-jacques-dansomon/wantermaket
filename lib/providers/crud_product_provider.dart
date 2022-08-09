import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wantermarket/data/models/body/product_crud_model.dart';
import 'package:wantermarket/data/repositories/crud_product_repo.dart';

import '../data/datasource/exception/api_error_handler.dart';
import '../data/models/body/product.dart';

class CrudProductProvider extends ChangeNotifier {
  CrudProductRepo crudProductRepo;
  CrudProductProvider({required this.crudProductRepo});

  bool isLoading = false;
  bool isError = false;
  String errorMessage = "";

  Future<bool> addProduct(ProductCrudModel productCrudModel, File imageLevel1, File? imageLevel2, File? imageLevel3) async {
    isLoading = true;
    isError = false;
    notifyListeners();
    errorMessage = "";
    FormData data = FormData.fromMap(productCrudModel.toJson());

    data.files.add(MapEntry('image_level1', await MultipartFile.fromFile(imageLevel1.path, filename: imageLevel1.path.split('/').last)));
    if(imageLevel2 != null){
      data.files.add(MapEntry('image_level2', await MultipartFile.fromFile(imageLevel2.path, filename: imageLevel2.path.split('/').last)));
    }
    if(imageLevel3 != null){
      data.files.add(MapEntry('image_level3', await MultipartFile.fromFile(imageLevel3.path, filename: imageLevel3.path.split('/').last)));
    }
    final response = await crudProductRepo.createProduct(data);
    if(response.error == null) {
      isLoading = false;
      isError = false;
      errorMessage = "";
      notifyListeners();
      return true;
    }else{
      isLoading = false;
      isError = true;
      errorMessage = ApiErrorHandler.getMessage(response.error);
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateProduct(int idProduct,  ProductCrudModel productCrudModel, File? imageLevel1, File? imageLevel2, File? imageLevel3) async {
    isLoading = true;
    isError = false;
    notifyListeners();
    errorMessage = "";
    FormData data = FormData.fromMap(productCrudModel.toJson());
    if(imageLevel1 != null){
      data.files.add(MapEntry('image_level1', await MultipartFile.fromFile(imageLevel1.path, filename: imageLevel1.path.split('/').last)));
    }
    if(imageLevel2 != null){
      data.files.add(MapEntry('image_level2', await MultipartFile.fromFile(imageLevel2.path, filename: imageLevel2.path.split('/').last)));
    }
    if(imageLevel3 != null){
      data.files.add(MapEntry('image_level3', await MultipartFile.fromFile(imageLevel3.path, filename: imageLevel3.path.split('/').last)));
    }
    final response = await crudProductRepo.updateProduct(data, idProduct);
    if(response.response.statusCode == 200 || response.response.statusCode == 201) {
      isLoading = false;
      isError = false;
      errorMessage = "";
      // notifyListeners();
      return true;
    }else{
      isLoading = false;
      isError = true;
      errorMessage = ApiErrorHandler.getMessage(response.error);
      notifyListeners();
      return false;
    }
  }

  Future<bool> deleteProduct(int idProduct) async {
    final response = await crudProductRepo.deleteProduct(idProduct);
    if(response.response.statusCode == 200 || response.response.statusCode == 201) {
      return true;
    }else{
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateDisponibility(Product product) async {
    product.disponibility == 'oui' ? product.disponibility = 'non' : product.disponibility = 'oui';
    errorMessage = "";
    ProductCrudModel productCrudModel = ProductCrudModel(
      disponibility: product.disponibility!,
      price: product.price!,
      descriptionBrief: product.descriptionBrief!,
      name: product.name!,
      priceBefore: product.priceBefore!,
      idCategory: product.idCategorie!,

    );
    final response = await crudProductRepo.updateDisponibility(product.id!, productCrudModel);
    if(response.response.statusCode == 200 || response.response.statusCode == 201) {
      isLoading = false;
      isError = false;
      errorMessage = "";
      notifyListeners();
      return true;
    }else{
      isLoading = false;
      isError = true;
      errorMessage = ApiErrorHandler.getMessage(response.error);
      notifyListeners();
      return false;
    }

  }



}