import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({Key? key, required this.item}) : super(key: key);

  final CartItem item;

  void _onItemDismissed(DismissDirection direction, Function removeHandler) {
    if (direction == DismissDirection.startToEnd) {}
  }

  @override
  Widget build(BuildContext context) {
    var removeItem = context.select<Cart, Function>((cart) => cart.remove);
    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.horizontal,
      onDismissed: (direction) =>
          removeItem(item.id, direction == DismissDirection.endToStart),
      background: Container(
        alignment: AlignmentDirectional.centerEnd,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      dismissThresholds: const {DismissDirection.horizontal: 0.5},
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Text(item.quantity.toString()),
          ),
          title: Text(item.name),
          trailing: Text('\$${item.price.toString()}'),
        ),
      ),
    );
  }
}
