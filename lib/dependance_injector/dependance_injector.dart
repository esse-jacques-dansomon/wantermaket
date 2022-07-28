

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wantermarket/data/fakedata/produit_json.dart';
import 'package:wantermarket/data/repositories/auth_repo.dart';
import 'package:wantermarket/data/repositories/boutique_favories_repo.dart';
import 'package:wantermarket/data/repositories/boutique_repo.dart';
import 'package:wantermarket/data/repositories/categories_repo.dart';
import 'package:wantermarket/data/repositories/crud_product_repo.dart';
import 'package:wantermarket/data/repositories/payment_repo.dart';
import 'package:wantermarket/data/repositories/plan_repo.dart';
import 'package:wantermarket/data/repositories/product_repo.dart';
import 'package:wantermarket/data/repositories/search_repo.dart';
import 'package:wantermarket/data/repositories/slider_repo.dart';
import 'package:wantermarket/data/repositories/vendor_repo.dart';
import 'package:wantermarket/providers/auth_provider.dart';
import 'package:wantermarket/providers/boutique_favories_provider.dart';
import 'package:wantermarket/providers/curd_product_provider.dart';
import 'package:wantermarket/providers/payment_provider.dart';
import 'package:wantermarket/providers/plan_provider.dart';
import 'package:wantermarket/providers/slider_provider.dart';
import 'package:wantermarket/providers/vendor_provider.dart';

import '../config/app_constantes.dart';
import '../data/datasource/dio/dio_client.dart';
import '../providers/boutique_provider.dart';
import '../providers/category_detail_provider.dart';
import '../providers/category_provider.dart';
import '../providers/product_provider.dart';
import '../providers/search_provider.dart';
import '../providers/wishlist_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Register services
  //pattern singleton

  // Core
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl(), sl()));

  // Repository
  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => BoutiqueRepo(dioClient: sl()));
  sl.registerLazySingleton(() => CategoryRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ProductsRepo(dioClient: sl()));
  sl.registerLazySingleton(() => SliderRepo(dioClient: sl()));
  sl.registerLazySingleton(() => SearchRepo(dioClient: sl()));
  sl.registerLazySingleton(() => VendorRepo(dioClient: sl()));
  sl.registerLazySingleton(() => PlanRepo(dioClient: sl()));
  sl.registerLazySingleton(() => BoutiqueFavoriesRepo(dioClient: sl()));
  sl.registerLazySingleton(() => CrudProductRepo(dioClient: sl()));
  sl.registerLazySingleton(() => PaymentRepo(dioClient: sl()));


  //Provider
  sl.registerLazySingleton(() => AuthProvider(authRepo: sl()));
  sl.registerLazySingleton(() => BoutiqueProvider(boutiqueRepo: sl()));
  sl.registerLazySingleton(() => CategoryProvider(categoryRepo: sl()));
  sl.registerLazySingleton(() => CategoryProviderDetails(categoryRepo: sl()));
  sl.registerLazySingleton(() => ProductProvider(productsRepo: sl()));
  sl.registerLazySingleton(() => SliderProvider(sliderRepo: sl()));
  sl.registerLazySingleton(() => SearchProvider(searchRepo: sl()));
  sl.registerLazySingleton(() => VendorProvider(vendorRepo: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => PlanProvider(planRepo: sl()));
  sl.registerLazySingleton(() => BoutiqueFavoriesProvider(boutiqueFavoriesRepo: sl()));
  sl.registerLazySingleton(() => CrudProductProvider(crudProductRepo: sl()));
  sl.registerLazySingleton(() => PaymentProvider(paymentRepo: sl()));
  sl.registerLazySingleton(() => WishlistProvider(prefs: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
}
