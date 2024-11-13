import 'package:flutter/cupertino.dart';

class Cart_Model {
  final String image;
  final String name;
  final int price;
  int quantity;
  Cart_Model(
      {required this.quantity,
      required this.image,
      required this.name,
      required this.price});
}

class CartItem {
  final String productId;
  final String name;
  final int quantity;
  final double price;
  final String image;

  CartItem({
    required this.productId,
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
  });

  // Convert CartItem to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': name,
      'quantity': quantity,
      'price': price,
      'imageName': image,
    };
  }

  // Create a CartItem from a Map (for Firestore)
  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      productId: map['productId'] ?? '',
      name: map['productName'] ?? '',
      quantity: map['quantity'] ?? 0,
      price: (map['price'] ?? 0.0).toDouble(),
      image: map['imageName'] ?? '',
    );
  }
}
