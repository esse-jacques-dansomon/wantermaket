import 'package:wantermarket/config/app_constantes.dart';

import '../datasource/dio/dio_client.dart';
import '../datasource/exception/api_error_handler.dart';
import '../models/response/api_response.dart';

class CategoryRepo {
  final DioClient dioClient;
  CategoryRepo({required this.dioClient});

  Future<ApiResponse> getCategories() async {
    try {
      final response = await dioClient.get(AppConstants.CATEGORIES_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getCategoryDetails(int id) async {
    try {
      final response = await dioClient.get('${AppConstants.CATEGORIES_URI}/$id');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getCategoryProducts(int id, int currentPage) async {
    try {
      final response = await dioClient.get('${AppConstants.CATEGORIES_URI}/$id/produits', queryParameters: {'page': currentPage});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getCategoryBoutiques(int id) async {
    try {
      final response = await dioClient.get('${AppConstants.CATEGORIES_URI}/$id/boutiques');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getCategoryBoutiquesPaginate(String url) async {
    try {final response = await dioClient.get(url);
    return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getSubCategoriesOfCategory(int id) async {
    try {
      final response = await dioClient.get('${AppConstants.CATEGORIES_URI}/$id/souscategories');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getSubCategoryDetails(int id) async {
    try {
      final response = await dioClient.get('${AppConstants.SOUS_CATEGORIES_URI}/$id');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getSubCategoryProducts(int id, int currentPage) async {
    try {
      final response = await dioClient.get('${AppConstants.SOUS_CATEGORIES_URI}/$id/produits', queryParameters: {'page': currentPage});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


}