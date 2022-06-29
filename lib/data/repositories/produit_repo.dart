import 'package:dio/dio.dart';
import '../datasource/dio/dio_client.dart';
import '../models/produit.dart';

class ProductRepo {
  final DioClient dioClient;
  ProductRepo({ required this.dioClient});

  Future<List<Produit>> getClasseProduits({required int pageNumber, required int id }) async {
    final Response response = await dioClient.getData('/produits/', params: {
      'page': pageNumber,
    });

    if (response.statusCode == 200) {
      final List<dynamic> results = response.data['results'];
      print("results: $results");
    }
    throw response;
  }



}