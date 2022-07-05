

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wantermarket/data/fakedata/produit_json.dart';
import 'package:wantermarket/data/repositories/boutique_repo.dart';
import 'package:wantermarket/data/repositories/categories_repo.dart';
import 'package:wantermarket/data/repositories/product_repo.dart';
import 'package:wantermarket/data/repositories/slider_repo.dart';
import 'package:wantermarket/providers/slider_provider.dart';

import '../config/app_constantes.dart';
import '../data/datasource/dio/dio_client.dart';
import '../providers/boutique_provider.dart';
import '../providers/category_provider.dart';
import '../providers/product_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Register services

  // Core
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl()));

  // Repository
  sl.registerLazySingleton(() => BoutiqueRepo(dioClient: sl()));
  sl.registerLazySingleton(() => CategoryRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ProductsRepo(dioClient: sl()));
  sl.registerLazySingleton(() => SliderRepo(dioClient: sl()));


  //Provider
  sl.registerLazySingleton(() => BoutiqueProvider(boutiqueRepo: sl()));
  sl.registerLazySingleton(() => CategoryProvider(categoryRepo: sl()));
  sl.registerLazySingleton(() => ProductProvider(productsRepo: sl()));
  sl.registerLazySingleton(() => SliderProvider(sliderRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
}
