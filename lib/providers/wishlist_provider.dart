import 'package:flutter/cupertino.dart';

import '../data/models/body/product.dart';

class WishlistProvider  extends ChangeNotifier {
  WishlistProvider();

  final List<Product> _wishlist = [];
  List<Product>  get wishlist => _wishlist;

  void addToWishlist(Product product) {
    if (!_wishlist.contains(product)) {
      _wishlist.add(product);
      notifyListeners();
      print('add product to wishlist');
    }
  }

  void removeFromWishlist(Product product) {
    _wishlist.remove(product);
    notifyListeners();
    print('remove product from wishlist');
  }

  void clearWishlist() {
    _wishlist.clear();
    notifyListeners();
  }

  bool isInWishlist(Product product) {
    return _wishlist.contains(product);
  }


}