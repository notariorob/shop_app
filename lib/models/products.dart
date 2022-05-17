import 'package:flutter/cupertino.dart';
import 'package:shop_app/data/mock_products.dart';
import 'package:shop_app/models/product.dart';

enum FilterOption { all, favorites }

class Products with ChangeNotifier {
  final List<Product> _products = MOCK_PRODUCTS;

  List<Product> fetchAll() => List.from(_products);
  List<Product> fetchFavorites() =>
      _products.where((product) => product.isFavorite).toList();

  Product fetchById(String id) =>
      _products.firstWhere((product) => product.id == id);

  void add() {
    // _products.add(val);
    notifyListeners();
  }
}
