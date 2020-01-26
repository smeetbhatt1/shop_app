import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;
import '../providers/orders.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const String RouteName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    final _cartProvider = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\u20B9 ${_cartProvider.totalAmount}',
                      style: TextStyle(
                          color:
                              Theme.of(context).primaryTextTheme.title.color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text('Place Order'),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                        _cartProvider.items.values.toList(),
                        _cartProvider.totalAmount,
                      );
                      _cartProvider.clear();
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _cartProvider.items.length,
              itemBuilder: (_, i) => CartItem(
                _cartProvider.items.values.toList()[i].id,
                _cartProvider.items.keys.toList()[i],
                _cartProvider.items.values.toList()[i].pricePerProduct,
                _cartProvider.items.values.toList()[i].quantity,
                _cartProvider.items.values.toList()[i].title,
              ),
            ),
          )
        ],
      ),
    );
  }
}
