import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product product = context.watch<Product>();
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed(ProductDetailScreen.routeName, arguments: product.id),
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(product.name),
            leading: IconButton(
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_outline),
              color: Colors.red,
              onPressed: product.toggleFavorite,
            ),
            trailing: Consumer<Cart>(builder: (_, cart, __) {
              bool inCart = cart.hasItem(product.id);
              return IconButton(
                icon: Icon(inCart
                    ? Icons.add_shopping_cart
                    : Icons.shopping_cart_outlined),
                color: Theme.of(context).accentColor,
                onPressed: () => cart.add(product),
              );
            }),
          ),
        ),
      ),
    );
  }
}
