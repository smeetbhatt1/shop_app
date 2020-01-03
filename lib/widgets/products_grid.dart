import 'package:flutter/material.dart';
import '../providers/products.dart';
import 'product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool _showFavs;
  ProductsGrid(this._showFavs);
  @override
  Widget build(BuildContext context) {
    final _productsProvider = Provider.of<Products>(context);
    final _products =
        _showFavs ? _productsProvider.favItems : _productsProvider.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: _products.length,
      itemBuilder: (_, i) {
        return ChangeNotifierProvider.value(
          value: _products[i],
          child: ProductItem(
              // _products[i].id, _products[i].title, _products[i].imageUrl
              ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
