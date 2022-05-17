import 'package:flutter/foundation.dart';
import 'package:shop_app/models/product.dart';

class CartItem {
  final String id;
  final String name;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.name,
    this.quantity = 1,
    required this.price,
  });

  @override
  String toString() =>
      'id: $id, name: $name, quantity: $quantity, price: $price';
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> fetchAll() => Map.from(_items);
  int get length => _items.length;

  bool hasItem(String productId) => _items.keys.contains(productId);

  void add(Product product) {
    print('adding ${product.name}');
    _items.update(
      product.id,
      (existingCartItem) => CartItem(
        id: existingCartItem.id,
        name: existingCartItem.name,
        price: existingCartItem.price,
        quantity: existingCartItem.quantity + 1,
      ),
      ifAbsent: () => CartItem(
        id: DateTime.now().toString(),
        name: product.name,
        price: product.price,
      ),
    );
    print(_items);
    notifyListeners();
  }

  void remove(String itemId, bool removeProductAlso) {
    if (removeProductAlso) {
      _items.removeWhere((key, value) => value.id == itemId);
    } else {
      var key = _items.keys.firstWhere((k) => _items[k]!.id == itemId);
      var newQuantity = _items[key]!.quantity - 1;

      if (newQuantity == 0) {
        _items.remove(key);
      } else {}
      _items.update(
        key,
        (value) => CartItem(
          id: value.id,
          name: value.name,
          price: value.price,
          quantity: newQuantity,
        ),
      );
    }
    // _items.remove(key)
    notifyListeners();
  }
}
