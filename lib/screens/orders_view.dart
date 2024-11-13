import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/order_model.dart';
import 'package:shopping_app/provider/order_provider.dart';

class OrdersView extends StatelessWidget {
  final String userId; // Pass the userId to fetch the orders

  const OrdersView({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders"),
      ),
      body: FutureBuilder<List<OrderPlaced>>(
        future: Provider.of<OrderProvider>(context, listen: false)
            .fetchOrders(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No orders found.'));
          }

          final orders = snapshot.data!;

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text('Order ID: ${order.id}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Amount: \$${order.totalAmount}'),
                      Text('Status: ${order.status}'),
                      Text('Order Date: ${order.orderDate}'),
                      Text('Delivery Date: ${order.deliveryDate}'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
