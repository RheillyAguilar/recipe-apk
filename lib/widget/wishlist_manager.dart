import 'package:recipe/model/food.dart';

class WishlistManager {
  static final WishlistManager _instance = WishlistManager._internal();

  factory WishlistManager() {
    return _instance;
  }

  WishlistManager._internal();

  final List<Food> _wishlist = [];

  List<Food> get wishlist => _wishlist;

  void addToWishList(Food food) {
    _wishlist.add(food);
  }

  void removeFromWishList(Food food) {
    _wishlist.remove(food);
  }

  bool isInWishlist(Food food) {
    return _wishlist.contains(food);
  }
}
