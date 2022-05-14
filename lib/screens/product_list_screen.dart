import 'package:flutter/material.dart';
import 'package:shop_app/data/mock_products.dart';
import 'package:shop_app/widgets/product_list_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: MOCK_PRODUCTS.length,
        itemBuilder: (context, index) => ProductListItem(
          product: MOCK_PRODUCTS[index],
        ),
      ),
    );
  }
}
