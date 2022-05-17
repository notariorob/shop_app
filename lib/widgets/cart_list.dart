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
    var totalPrice = cart.totalPrice;

    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text('Total'),
                const Spacer(),
                Chip(
                  label: Text('$totalPrice'),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () => {},
                  child: Text('ORDER NOW'),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              CartItem item = cartItems.values.elementAt(index);
              return CartListItem(item: item);
            },
          ),
        ),
      ],
    );
  }
}
