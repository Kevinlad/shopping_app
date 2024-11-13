import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/model/order_model.dart';

class OrderProvider with ChangeNotifier {
  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // This method is responsible for saving an order to Firestore
  Future<void> placeOrder(OrderPlaced order) async {
    try {
      // Convert the Order object to a Map
      Map<String, dynamic> orderData = order.toMap();

      // Save the order to Firestore under the 'orders' collection
      await _firestore.collection('orders').doc(order.id).set(orderData);

      // Notify listeners in case the state needs to change after placing the order
      notifyListeners();
    } catch (e) {
      // Handle any errors here (e.g., show a dialog or toast)
      print('Error placing order: $e');
      throw e; // You can throw this to handle it in the UI
    }
  }

  // You can also fetch all orders for a user from Firestore
  Future<List<OrderPlaced>> fetchOrders(String userId) async {
    try {
      // Fetch all orders for the specified user
      QuerySnapshot snapshot = await _firestore
          .collection('orders')
          .where('userId', isEqualTo: userId)
          .get();

      // Map each document to an Order object
      List<OrderPlaced> orders = snapshot.docs
          .map((doc) {
            return OrderPlaced.fromMap(doc.data() as Map<String, dynamic>);
          })
          .cast<OrderPlaced>()
          .toList();

      return orders;
    } catch (e) {
      print('Error fetching orders: $e');
      throw e; // Handle errors accordingly
    }
  }
}
