import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';

import '../data/models/body/product.dart';
import '../shared/app_helper.dart';

class WishlistProvider  extends ChangeNotifier {
  WishlistProvider();

  final List<Product> _wishlist = [];
  List<Product>  get wishlist => _wishlist;

  void addToWishlist(Product product, BuildContext context) {
    if (!_wishlist.contains(product)) {
      _wishlist.add(product);
      AppHelper.showInfoFlushBar(
          context,
          '${product.name} ajouté à votre liste de souhaits',
          color: AppColors.PRIMARY

      );

      notifyListeners();
    }
  }

  void removeFromWishlist(Product product, BuildContext context) {
    _wishlist.remove(product);
    AppHelper.showInfoFlushBar(
        context,
        '${product.name} envelé à votre liste de souhaits',
        color: AppColors.PRIMARY

    );
    notifyListeners();
  }

  void clearWishlist() {
    _wishlist.clear();
    notifyListeners();
  }

  bool isInWishlist(Product product) {
    return _wishlist.contains(product);
  }


}