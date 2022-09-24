import 'package:wantermarket/data/datasource/dio/dio_client.dart';

import '../../config/app_constantes.dart';
import '../datasource/exception/api_error_handler.dart';
import '../models/response/api_response.dart';

class ProductsRepo {
  final DioClient dioClient;
  ProductsRepo({required this.dioClient});

  //top annonces
  Future<ApiResponse> getTopAnnonces() async {
    try {
      final response = await dioClient.get(AppConstants.TOP_PRODUITS_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  //deal of the day
  Future<ApiResponse> getDealsOfTheDay() async {
    try {
      final response = await dioClient.get(AppConstants.DEAL_PRODUITS_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }

  }

  //new products
  Future<ApiResponse> getNewProducts({int page = 1}) async {
    try {
      final response = await dioClient.get(AppConstants.PRODUITS_URI,
        queryParameters: {'page': page});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  //related products
  Future<ApiResponse> getRelatedProducts(int categoryId) async {
    try {
      final response = await dioClient.get('${AppConstants.SOUS_CATEGORIES_URI}/$categoryId/produits');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


}