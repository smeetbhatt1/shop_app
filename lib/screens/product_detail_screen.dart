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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                _product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\u20B9 ${_product.price}',
              style: TextStyle(color: Colors.grey, fontSize: 20.0),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  _product.description,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ))
          ],
        ),
      ),
    );
  }
}
