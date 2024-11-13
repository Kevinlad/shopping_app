import 'package:flutter/material.dart';
import 'package:shopping_app/model/product_model.dart';

class WishlistProvider with ChangeNotifier {
  List<Product_Model> _wishlist = [];

  List<Product_Model> get wishlist => _wishlist;

  // Add item to the wishlist
  void addToWishlist(Product_Model product) {
    _wishlist.add(product);
    notifyListeners();
  }

  // Remove item from the wishlist
  void removeFromWishlist(Product_Model product) {
    _wishlist.remove(product);
    notifyListeners();
  }

  // Check if the product is in the wishlist
  bool isInWishlist(Product_Model product) {
    return _wishlist.contains(product);
  }
}
