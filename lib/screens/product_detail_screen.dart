import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String RouteName = '/product-detail';
  // final String _title;
  // ProductDetailScreen(this._title);

  @override
  Widget build(BuildContext context) {
    final _id = ModalRoute.of(context).settings.arguments;
    final _product =
        Provider.of<Products>(context, listen: false).findById(_id);
    return Scaffold(
      appBar: AppBar(
        title: Text(_product.title),
      ),
    );
  }
}
