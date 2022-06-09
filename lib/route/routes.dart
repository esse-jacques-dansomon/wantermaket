import 'package:flutter/material.dart';

import '../ui/screens/auth/login_screen.dart';
import '../ui/screens/auth/register_screen.dart';
import '../ui/screens/category/category_screen.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/recherche/search_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String profile = '/profile';
  static const String search = '/search';
  static const String product = '/product';
  static const String category = '/category';
  static const String shop = '/shop';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String order = '/order';
  static const String orderDetail = '/order-detail';
  static const String orderSuccess = '/order-success';
  static const String orderHistory = '/order-history';
  static const String orderHistoryDetail = '/order-history-detail';


  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch(settings.name) {
      case login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case search:
        return MaterialPageRoute(builder: (context) => const SearchScreen());
      case category:
        return MaterialPageRoute(builder: (context) => const CategoryScreen());
      default:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
  }


}