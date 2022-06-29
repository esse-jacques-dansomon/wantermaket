import 'package:dio/dio.dart';
class DioClient{

  final Dio dio = Dio();
  Future<Response> getData(String path, {Map<String, dynamic>? params}) async {
   
    String url = "http://10.0.2.2:8000/api/" + path;
    Map<String, dynamic> query = {};

    if (params != null) {
      query.addAll(params);
    }
   

    final Response response = await dio.get(url, queryParameters: query);

    if (response.statusCode == 200) {
      print("response.data: ${response.data}");
      return response;
    }
    throw response;
  }
}