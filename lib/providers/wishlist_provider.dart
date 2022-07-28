import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/config/app_constantes.dart';

import '../data/models/body/product.dart';
import '../shared/app_helper.dart';

class WishlistProvider  extends ChangeNotifier {
  final SharedPreferences prefs;
  WishlistProvider({required this.prefs});
  final List<Product>  _wishlist = [];
  List<Product>  get wishlist => _wishlist ;

  List<Product>  get wishlist0 => productFromMap(prefs.getString(AppConstants.WISHLIST) ?? '[]');
  set wishlist0(List<Product> value) {
    prefs.setString(AppConstants.WISHLIST, productToMap(value));
  }

  void addToWishlist(Product product, BuildContext context)  {
    print(wishlist.length);
    if (!wishlist.contains(product)) {
      wishlist.add(product);
      prefs.setString(AppConstants.WISHLIST, '');
      prefs.setString(AppConstants.WISHLIST, productToMap(wishlist));
      print(prefs.getString(AppConstants.WISHLIST));
      AppHelper.showInfoFlushBar(
          context,
          '${product.name} ajouté à votre liste de souhaits',
          color: AppColors.PRIMARY

      );
      notifyListeners();
    }
  }

  void removeFromWishlist(Product product, BuildContext context) {
    if(wishlist.contains(product)){
      wishlist.remove(product);
      AppHelper.showInfoFlushBar(
          context,
          '${product.name} envelé à votre liste de souhaits',
          color: AppColors.PRIMARY

      );
      notifyListeners();
    }

  }

  void clearWishlist() {
    wishlist.clear();
    notifyListeners();
  }

  bool isInWishlist(Product product) {
    return wishlist.contains(product);
  }


}