class OrderItem {
  final String productId;
  final String productName;
  final double price;
  final int quantity;

  OrderItem({
    required this.productId,
    required this.productName,
    required this.price,
    required this.quantity,
  });

  // Convert an OrderItem to a map for saving in Firestore or any database
  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'price': price,
      'quantity': quantity,
    };
  }

  // Create an OrderItem from a map (e.g., when fetching from Firestore)
  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      productId: map['productId'] ?? '',
      productName: map['productName'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }
}
class OrderPlaced {
  final String id;
  final String address;
  final DateTime deliveryDate;
  final String status;
  final String paymentMethod;
  final DateTime orderDate;
  final double totalAmount;
  final String userId;
  final List<OrderItem> items;

  OrderPlaced({
    required this.id,
    required this.address,
    required this.deliveryDate,
    required this.status,
    required this.paymentMethod,
    required this.orderDate,
    required this.totalAmount,
    required this.userId,
    required this.items,
  });

  // Convert an Order to a map for saving in Firestore or any database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': address,
      'deliveryDate': deliveryDate.toIso8601String(),
      'status': status,
      'paymentMethod': paymentMethod,
      'orderDate': orderDate.toIso8601String(),
      'totalAmount': totalAmount,
      'userId': userId,
      'items': items.map((item) => item.toMap()).toList(), // Convert each item to a map
    };
  }

  // Create an Order from a map (e.g., when fetching from Firestore)
  factory OrderPlaced.fromMap(Map<String, dynamic> map) {
    return OrderPlaced(
      id: map['id'] ?? '',
      address: map['address'] ?? '',
      deliveryDate: DateTime.parse(map['deliveryDate'] ?? DateTime.now().toIso8601String()),
      status: map['status'] ?? '',
      paymentMethod: map['paymentMethod'] ?? '',
      orderDate: DateTime.parse(map['orderDate'] ?? DateTime.now().toIso8601String()),
      totalAmount: map['totalAmount']?.toDouble() ?? 0.0,
      userId: map['userId'] ?? '',
      items: (map['items'] as List<dynamic>).map((item) => OrderItem.fromMap(item)).toList(),
    );
  }
}
