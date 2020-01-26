import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const String RouteName = '/orders';

  @override
  Widget build(BuildContext context) {
    final _orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: _orders.orders.length,
        itemBuilder: (_, i) {
          return OrderItem(_orders.orders[i]);
        },
      ),
    );
  }
}
