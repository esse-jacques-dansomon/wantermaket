// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/data/models/body/boutique.dart';
import 'package:wantermarket/data/models/body/product.dart';
import 'package:wantermarket/providers/auth_provider.dart';
import 'package:wantermarket/ui/screens/abonnement/abonnement_screen.dart';
import 'package:wantermarket/ui/screens/add_product/add_product_screen.dart';
import 'package:wantermarket/ui/screens/auth/edit_profil_screen.dart';
import 'package:wantermarket/ui/screens/auth/forgot_password_screen.dart';
import 'package:wantermarket/ui/screens/auth/otp_screen.dart';
import 'package:wantermarket/ui/screens/auth/reset_password_screen.dart';
import 'package:wantermarket/ui/screens/become_exclusive/become_exclusive.dart';
import 'package:wantermarket/ui/screens/boutique_details/boutique_details_screen.dart';
import 'package:wantermarket/ui/screens/boutique_follow/boutique_favories.dart';
import 'package:wantermarket/ui/screens/category/all_categories_screen.dart';
import 'package:wantermarket/ui/screens/edit_boutique/edit_boutique_screen.dart';
import 'package:wantermarket/ui/screens/notification/notification_screen.dart';
import 'package:wantermarket/ui/screens/sector/sector_screen.dart';
import 'package:wantermarket/ui/screens/dashboard/dashboard_screen.dart';
import 'package:wantermarket/ui/screens/produit/produit_details_screen.dart';
import 'package:wantermarket/ui/basewidgets/user-actions-account-status/no_internet_screen.dart';
import 'package:wantermarket/ui/screens/splash/splash_screen.dart';
import 'package:wantermarket/ui/screens/wishlist/wishlist_screen.dart';

import '../data/models/body/category.dart';
import '../ui/screens/auth/login_screen.dart';
import '../ui/screens/auth/register_screen.dart';
import '../ui/screens/auth/start_screen.dart';
import '../ui/screens/boutiques_by_secteur/boutique_by_secteur_screen.dart';
import '../ui/screens/category/category_details_screen.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/recherche/search_screen.dart';
import '../ui/screens/see_more_screen/see_more_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String logout = '/logout';
  static const String becomeExclusive = '/become_exclusive';
  static const String register = '/register';
  static const String splash = '/';
  static const String forgotPassword = '/forgot_password';
  static const String resetPassword = '/reset_password';
  static const String otp = '/otp';
  static const String profile = '/profile';
  static const String editProfile = '/edit_profile';
  static const String search = '/search';
  static const String seeMore = '/see-more';
  static const String product = '/product';
  static const String addProduct = '/add_product';
  static const String category = '/category';
  static const String categories = '/categories';
  static const String vendor = '/vendor';
  static const String boutiqueBySecteur = '/boutique_by_secteur';
  static const String editBoutiqueBySecteur = '/egit_boutique_by_secteur';
  static const String shop = '/secteur';
  static const String notification = '/notifications';
  static const String hasNotification = '/has_notifications';
  static const String wishList = '/wish_list';
  static const String favoritesBoutiques = '/boutique_favories';
  static const String abonnements = '/abonnements';
  static const String noInternet = '/no-internet';


  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    Widget isLoggedIn(Widget loggedWidget, { Widget notLogged=const LoginScreen() }) => Consumer<AuthProvider>(
      builder: (context, auth, child) {
      return  auth.isLoggedIn() ? (loggedWidget) : notLogged;
      },
    );


    switch(settings.name) {
      case login:
        return MaterialPageRoute(builder: (context) => isLoggedIn( const DashBoardScreen()) );
      case register:
        return MaterialPageRoute(builder: (context) => isLoggedIn( const DashBoardScreen(), notLogged: const RegisterScreen()) );
      case home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case shop:
        return MaterialPageRoute(builder: (context) => const SecteurScreen());
      case addProduct:
        if(settings.arguments != null) {
          return MaterialPageRoute(builder: (context) =>  AddProductScreen(product: settings.arguments as Product));
        } else {
          return MaterialPageRoute(builder: (context) =>  const AddProductScreen());
        }
      case search:
        return MaterialPageRoute(builder: (context) => const SearchScreen());
      case seeMore:
        String title = settings.arguments as String;
        return MaterialPageRoute(builder: (context) =>  SeeMoreScreen(title: title));
      case profile:
        return MaterialPageRoute(builder: (context) => isLoggedIn( const DashBoardScreen()));
      case editProfile:
        return MaterialPageRoute(builder: (context) => const EditProfileScreen());
      case category:
        final category = settings.arguments as Category;
        return MaterialPageRoute(builder: (context) =>  CategoryScreen(category: category,));
      case categories:
        return MaterialPageRoute(builder: (context) => const AllCategoriesScreen());
      case vendor:
        final boutique = settings.arguments as Boutique;
        if (boutique.name != null){
          return MaterialPageRoute(builder: (context) =>  BoutiqueDetailsScreen(boutique: boutique));
        }
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case boutiqueBySecteur:
        final category = settings.arguments as Category;
        return MaterialPageRoute(builder: (context) =>  BoutiqueBySecteurScreen(category : category));
      case product:
        final arguments = settings.arguments as Product;
        if (arguments.name != null){
        return MaterialPageRoute(builder: (context) =>  ProductDetailsScreen(product: arguments));
        }
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case notification:
        return MaterialPageRoute(builder: (context) => const NotificationScreen());
      case favoritesBoutiques:
        return MaterialPageRoute(builder: (context) => const BoutiquesFavoriesScreen());
      case wishList:
        return MaterialPageRoute(builder: (context) => const WishlistScreen());
      case splash:
        return MaterialPageRoute(builder: (context) => const SlashScreen());
      case abonnements:
        return MaterialPageRoute(builder: (context) => const AbonnementScreen());
      case editBoutiqueBySecteur:
        return MaterialPageRoute(builder: (context) => const EditBoutiqueScreen( ));
      case forgotPassword:
        return MaterialPageRoute(builder: (context) => const ForgotPasswordFromScreen());
      case resetPassword:
        return MaterialPageRoute(builder: (context) => const ResetPasswordFromScreen());
      case otp:
        final email = settings.arguments as String;
        return MaterialPageRoute(builder: (context) =>  OtpScreen(email: email,));
      case becomeExclusive:
        return MaterialPageRoute(builder: (context) => const BecomeExclusiveScreen());
      case noInternet:
        return MaterialPageRoute(builder: (context) => const NoInternetScreen());
      default:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
  }


}