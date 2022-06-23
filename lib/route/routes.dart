import 'package:flutter/material.dart';
import 'package:wantermarket/ui/screens/abonnement/abonnement_screen.dart';
import 'package:wantermarket/ui/screens/add_product/add_product_screen.dart';
import 'package:wantermarket/ui/screens/boutique/boutique_details_screen.dart';
import 'package:wantermarket/ui/screens/boutique_follow/boutique_favories.dart';
import 'package:wantermarket/ui/screens/category/all_categories_screen.dart';
import 'package:wantermarket/ui/screens/notification/notification_screen.dart';
import 'package:wantermarket/ui/screens/sector/secteur_screen.dart';
import 'package:wantermarket/ui/screens/mon_compte/dashboard_screen.dart';
import 'package:wantermarket/ui/screens/produit/produit_details_screen.dart';
import 'package:wantermarket/ui/screens/wishlist/wishlist_screen.dart';

import '../ui/screens/auth/login_screen.dart';
import '../ui/screens/auth/register_screen.dart';
import '../ui/screens/boutique/boutique_by_secteur_screen.dart';
import '../ui/screens/category/category_details_screen.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/recherche/search_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot_password';
  static const String profile = '/profile';
  static const String search = '/search';
  static const String product = '/product';
  static const String addProduct = '/add_product';
  static const String category = '/category';
  static const String categories = '/categories';
  static const String vendor = '/vendor';
  static const String boutiqueBySecteur = '/boutique_by_secteur';
  static const String shop = '/secteur';
  static const String notification = '/notifications';
  static const String hasnotification = '/has_notifications';
  static const String wishList = '/wish_list';
  static const String favoritesBoutiques = '/boutique_favories';
  static const String abonnements = '/abonnements';





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
      case addProduct:
        return MaterialPageRoute(builder: (context) => const AddProductScreen());
      case search:
        return MaterialPageRoute(builder: (context) => const SearchScreen());
      case profile:
        return MaterialPageRoute(builder: (context) => const DashBoardScreen());
      case category:
        return MaterialPageRoute(builder: (context) => const CategoryScreen());
      case categories:
        return MaterialPageRoute(builder: (context) => const AllCategoriesScreen());
      case vendor:
        return MaterialPageRoute(builder: (context) => const BoutiqueDetailsScreen());
      case boutiqueBySecteur:
        return MaterialPageRoute(builder: (context) => const BoutiqueBySecteurScreen());
      case product:
        return MaterialPageRoute(builder: (context) => const ProduitDetailsScreen());
      case notification:
        return MaterialPageRoute(builder: (context) => const NotificationScreen());
      case favoritesBoutiques:
        return MaterialPageRoute(builder: (context) => const BoutiquesFavoriesScreen());
      case wishList:
        return MaterialPageRoute(builder: (context) => const WishlistScreen());
      case abonnements:
        return MaterialPageRoute(builder: (context) => const AbonnementScreen());
      default:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
  }


}