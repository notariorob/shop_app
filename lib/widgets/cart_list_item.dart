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
      key: UniqueKey(),
      behavior: HitTestBehavior.translucent,
      direction: DismissDirection.horizontal,
      onDismissed: (direction) =>
          removeItem(item.id, direction == DismissDirection.endToStart),
      background: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).errorColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                Text('Delete 1', style: TextStyle(color: Colors.white)),
              ],
            ),
            Row(
              children: const [
                Text(
                  'Delete all',
                  style: TextStyle(color: Colors.white),
                ),
                Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
      dismissThresholds: const {DismissDirection.horizontal: 0.5},
      child: ListTile(
        leading: CircleAvatar(
          child: Text(item.quantity.toString()),
        ),
        title: Text(item.name),
        trailing: Text('\$${item.price.toString()}'),
      ),
    );
  }
}
