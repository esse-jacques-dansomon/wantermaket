import 'package:wantermarket/config/app_constantes.dart';

import '../datasource/dio/dio_client.dart';
import '../datasource/exception/api_error_handler.dart';
import '../models/response/api_response.dart';

class ProductDetailsRepo {
  final DioClient dioClient;
  ProductDetailsRepo({required this.dioClient});

}