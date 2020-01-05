import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String _id;
  final String _productId;
  final double _price;
  final int _quantity;
  final String _title;

  CartItem(this._id, this._productId, this._price, this._quantity, this._title);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(_id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 10),
        margin: EdgeInsets.symmetric(vertical: 4),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(
          context,
          listen: false,
        ).removeItem(_productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('\u20B9 $_price'),
                ),
              ),
            ),
            title: Text(_title),
            subtitle: Text('Total: \u20B9 ${(_price * _quantity)}'),
            trailing: Text('$_quantity x'),
          ),
        ),
      ),
    );
  }
}
