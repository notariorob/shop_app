import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/widgets/product_list_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({Key? key, this.onlyFavorites = false}) : super(key: key);

  final bool onlyFavorites;

  @override
  Widget build(BuildContext context) {
    var products = context.select<Products, List<Product>>(
        (value) => onlyFavorites ? value.fetchFavorites() : value.fetchAll());
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) => ChangeNotifierProvider<Product>.value(
        value: products[index],
        child: const ProductListItem(),
      ),
    );
  }
}
