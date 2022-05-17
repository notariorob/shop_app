import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/widgets/cart_list_item.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var products = context.select<Products, List<Product>>((value) => value.fetchAll());
    var cart = context.watch<Cart>();
    var cartItems = cart.fetchAll();
    print(cartItems);

    // var productsInCart = products.where((product) => cartItems.keys.contains(product.id));
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        String key = cartItems.keys.elementAt(index);
        return CartListItem(item: cartItems[key]!);
      },
    );
  }
}
