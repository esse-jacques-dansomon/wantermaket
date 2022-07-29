import 'dart:io';

import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/auth_provider.dart';
import 'package:wantermarket/providers/boutique_favories_provider.dart';
import 'package:wantermarket/providers/boutique_provider.dart';
import 'package:wantermarket/providers/category_detail_provider.dart';
import 'package:wantermarket/providers/category_provider.dart';
import 'package:wantermarket/providers/curd_product_provider.dart';
import 'package:wantermarket/providers/payment_provider.dart';
import 'package:wantermarket/providers/plan_provider.dart';
import 'package:wantermarket/providers/product_provider.dart';
import 'package:wantermarket/providers/search_provider.dart';
import 'package:wantermarket/providers/slider_provider.dart';
import 'package:wantermarket/providers/vendor_provider.dart';
import 'package:wantermarket/providers/wishlist_provider.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/ui/screens/home/home_screen.dart';
import './dependance_injector/dependance_injector.dart' as di;
import 'config/app_colors.dart';



class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

Future<void> main() async {

  // HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
    runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SliderProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<BoutiqueProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<CategoryProviderDetails>()),
      ChangeNotifierProvider(create: (context) => di.sl<CategoryProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ProductProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SearchProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<VendorProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<WishlistProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<PlanProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<PaymentProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<CrudProductProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<BoutiqueFavoriesProvider>()),

      // ChangeNotifierProvider(create: (context) => di.sl<ConnectivityProvider>()),
    ],
    child: const MyApp()),);

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConnectivityAppWrapper(
      app: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          title: 'WANTERMARKET',
          theme: buildThemeData(),
          home: const Scaffold(
            body: HomeScreen(),
          ),
      ),
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
        ),
        selectedItemColor: AppColors.PRIMARY,
        unselectedItemColor: Colors.black45,

      ),
    );
  }
}

