import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/products_grid.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  bool _favoritesOnly = false;

  void _toggleFavoritesOnly() {
    setState(() {
      _favoritesOnly = !_favoritesOnly;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        actions: [
          Consumer<Cart>(
            builder: (_, cart, child) => Badge(
              position: BadgePosition.topEnd(
                top: -5,
                end: -3,
              ),
              showBadge: cart.length > 0,
              badgeContent: Text(cart.length.toString()),
              child: child,
            ),
            child: IconButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(CartScreen.routeName),
              icon: const Icon(Icons.shopping_cart_checkout),
            ),
          ),
          PopupMenuButton(
              onSelected: (_) => _toggleFavoritesOnly(),
              icon: const Icon(Icons.tune),
              itemBuilder: (_) => const [
                    PopupMenuItem(
                      child: Text('Favorites'),
                      value: FilterOption.favorites,
                    ),
                    PopupMenuItem(
                      child: Text('All'),
                      value: FilterOption.all,
                    ),
                  ])
        ],
      ),
      body: ProductsGrid(
        onlyFavorites: _favoritesOnly,
      ),
    );
  }
}
