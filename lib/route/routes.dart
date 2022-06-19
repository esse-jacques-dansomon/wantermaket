import 'package:flutter/material.dart';
import 'package:wantermarket/ui/screens/boutique/boutique_details_screen.dart';
import 'package:wantermarket/ui/screens/boutique/secteur_screen.dart';
import 'package:wantermarket/ui/screens/mon_compte/dashboard_screen.dart';
import 'package:wantermarket/ui/screens/produit/produit_details_screen.dart';

import '../ui/screens/auth/login_screen.dart';
import '../ui/screens/auth/register_screen.dart';
import '../ui/screens/boutique/boutique_by_secteur_screen.dart';
import '../ui/screens/category/category_screen.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/profile/profile_screen.dart';
import '../ui/screens/recherche/search_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String profile = '/profile';
  static const String search = '/search';
  static const String product = '/product';
  static const String category = '/category';
  static const String vendor = '/vendor';
  static const String boutique_by_secteur = '/boutique_by_secteur';
  static const String shop = '/secteur';



  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch(settings.name) {
      case login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case shop:
        return MaterialPageRoute(builder: (context) => const SecteurScreen());
      case search:
        return MaterialPageRoute(builder: (context) => const SearchScreen());
      case profile:
        return MaterialPageRoute(builder: (context) => const DashBoardScreen());
      case category:
        return MaterialPageRoute(builder: (context) => const CategoryScreen());
      case vendor:
        return MaterialPageRoute(builder: (context) => const BoutiqueDetailsScreen());
      case boutique_by_secteur:
        return MaterialPageRoute(builder: (context) => const BoutiqueBySecteurScreen());
      case product:
        return MaterialPageRoute(builder: (context) => const ProduitDetailsScreen());
      default:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
  }


}