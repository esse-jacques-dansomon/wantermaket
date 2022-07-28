import 'package:dio/dio.dart';
import 'package:wantermarket/config/app_constantes.dart';
import 'package:wantermarket/data/models/body/product_crud_model.dart';
import 'package:wantermarket/data/models/response/api_response.dart';

import '../datasource/dio/dio_client.dart';
import '../datasource/exception/api_error_handler.dart';
import '../models/body/product.dart';

class CrudProductRepo{
  DioClient dioClient;
  CrudProductRepo({required this.dioClient});

  Future<ApiResponse> createProduct(FormData product) async{
    try{
     final response = await dioClient.post(AppConstants.PRODUITS_URI, data: product);
     print(response.statusCode);
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> updateProduct(FormData product, int productId) async{
    try{
      final response = await dioClient.post('${AppConstants.PRODUITS_URI}/$productId', data: product);
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteProduct(int productId) async{
    try{
      final response = await dioClient.delete('${AppConstants.PRODUITS_URI}/$productId');
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateDisponibility(int productId, ProductCrudModel productCrudModel) async{
    try{
      final response = await dioClient.post('${AppConstants.PRODUITS_URI}/$productId', data: productCrudModel.toJson());
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


}