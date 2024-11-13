import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/order_model.dart';
import 'package:shopping_app/provider/google_sign.dart';
import 'package:shopping_app/screens/new_category.dart';
import 'package:shopping_app/screens/order_shipping.dart';

import '../model/cart_model.dart';
import '../provider/address_provider.dart';
import '../provider/order_provider.dart';
import '../provider/payment_provider.dart';

class OrderReview extends StatefulWidget {
  const OrderReview({super.key, required this.total, required this.cartItems});
  final int? total;
  final List<CartItem> cartItems;
  @override
  State<OrderReview> createState() => _OrderReviewState();
}

class _OrderReviewState extends State<OrderReview> {
  List<OrderItem> items = [
    OrderItem(
      productId: '123',
      productName: 'Product 1',
      price: 10.99,
      quantity: 2,
    ),
    OrderItem(
      productId: '456',
      productName: 'Product 2',
      price: 25.50,
      quantity: 1,
    ),
  ];
  void initState() {
    super.initState();

    // Fetch addresses when this screen is loaded
    Future.microtask(() {
      Provider.of<AddressProvider>(context, listen: false).fetchAddresses();
    });
  }

  @override
  Widget build(BuildContext context) {
    final googleSignInProvider = Provider.of<GoogleSignInProvider>(context);
    final paymentProvider = Provider.of<PaymentProvider>(context);
    final addressProvider = Provider.of<AddressProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ///Cart item
              // const ProductHorizontalview(),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: widget.cartItems.length,
              //     // Remove shrinkWrap because Expanded handles the layout
              //     physics:
              //         const BouncingScrollPhysics(), // Or ScrollPhysics of your choice
              //     itemBuilder: (context, index) {
              //       final item = widget.cartItems[index];
              //       return ProductHorizontalview(
              //         image: item.image,
              //         name: item.name,
              //         brand: 'Brand Name', // Replace with actual data
              //         price: item.price,
              //         quantity: item.quantity,
              //       );
              //     },
              //   ),
              // ),

              /// Apply Coupon Textfield
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white38),
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.only(
                      top: 5, right: 10, left: 10, bottom: 10),
                  child: Row(children: [
                    Flexible(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Have a promo code? Enter here.',
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none),
                      ),
                    ),

                    /// Button
                    SizedBox(
                        width: 90,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    Colors.white30.withOpacity(0.5),
                                backgroundColor:
                                    Colors.grey[500]!.withOpacity(0.3)),
                            child: const Text("Apply")))
                  ]),
                ),
              ),

              //////  Billing Statement
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      billing(widget.total ?? 0),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 15,
                      ),
                      payment()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
            onPressed: () async {
              final OrderPlaced order = OrderPlaced(
                id: DateTime.now()
                    .millisecondsSinceEpoch
                    .toString(), // Unique ID based on time
                address:
                    "${addressProvider.selectedAddress!.street}, ${addressProvider.selectedAddress!.city}, ${addressProvider.selectedAddress!.postalCode}", // Replace with actual address
                deliveryDate: DateTime.now()
                    .add(Duration(days: 7)), // Estimated delivery date
                status: 'Pending', // Initial status of the order
                paymentMethod: paymentProvider
                    .selectedPaymentMethod, // Replace with the selected payment method
                orderDate: DateTime.now(), // Current date as order date
                totalAmount: 255.0, // Replace with the calculated total amount
                userId: googleSignInProvider.id, // Current user's ID
                items: items, // List of order items
              );

              try {
                // Call the provider to save the order
                await Provider.of<OrderProvider>(context, listen: false)
                    .placeOrder(order);

                // Display success message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Order placed successfully!')),
                );

                // Navigate or perform additional actions after successful checkout
              } catch (e) {
                // Handle error (e.g., display a message)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error placing order: $e')),
                );
              }

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrderShipping()));
            },
            child: const Text("Checkout ${255.0}")),
      ),
    );
  }

  Widget billing(int total) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "SubTotal",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Text("\$$total")
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "Shipping Fee",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Text("\$5.0")
      ]),
      const SizedBox(height: 10),
      const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("Tax Fee", style: TextStyle(fontWeight: FontWeight.w600)),
        Text("\$15.0")
      ]),
      const SizedBox(height: 10),
      const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("Order Total", style: TextStyle(fontWeight: FontWeight.w600)),
        Text("\$275.0",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
      ])
    ]);
  }

  void placeOrder() {
    List<OrderItem> items = [
      OrderItem(
        productId: '123',
        productName: 'Product 1',
        price: 10.99,
        quantity: 2,
      ),
      OrderItem(
        productId: '456',
        productName: 'Product 2',
        price: 25.50,
        quantity: 1,
      ),
    ];

    OrderPlaced order = OrderPlaced(
      id: 'order1',
      address: '123 Main St, City, Country',
      deliveryDate: DateTime.now().add(Duration(days: 5)),
      status: 'Pending',
      paymentMethod: 'Paypal',
      orderDate: DateTime.now(),
      totalAmount: 46.48,
      userId: 'user1',
      items: items,
    );

    // You can now convert this order to a map to save it in a database
    Map<String, dynamic> orderData = order.toMap();

    print(orderData); // This will print the order details in a map format
  }

  Widget payment() {
    final googleSignInProvider = Provider.of<GoogleSignInProvider>(context);
    String selectedPaymentMethod = "Paypal";
    // Fetch user details from provider
    final user = googleSignInProvider.user;
    final email = googleSignInProvider.email;
    final name = googleSignInProvider.name;
    final phone = googleSignInProvider.phoneNumber;
    String selectedAddress = "Select an Address";

    if (name.isEmpty || email.isEmpty || phone.isEmpty) {
      // Fetch user data if not fetched yet
      Future.microtask(() => googleSignInProvider.fetchUserData());
      return const Center(child: CircularProgressIndicator());
    }
    final List<String> paymentMethods = ["Paypal", "Mastercard", "Visa"];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Payment Method",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            GestureDetector(
                onTap: () {
                  selectPayment(context, paymentMethods);
                },
                child: const Text("Change"))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            // Image.asset('assets/images/mastercard1.png')
            // Icon(Icons.payment),
            Consumer<PaymentProvider>(
              builder: (context, paymentProvider, child) {
                return Row(
                  children: [
                    Icon(Icons.payment),
                    const SizedBox(width: 10),
                    Text(paymentProvider.selectedPaymentMethod),
                  ],
                );
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Shipping Address",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          GestureDetector(
              onTap: () {
                selectAddress(
                    context, selectedAddress); // Open the address modal
              },
              child: const Text("Change")),
        ]),
        const SizedBox(height: 15),
        Text(name.isNotEmpty ? name : 'User',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        Row(
          children: [
            const Icon(Icons.phone, size: 15),
            const SizedBox(width: 10),
            Text(phone.isNotEmpty ? phone : '+91-910-4363701')
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(
              Icons.location_history,
              size: 15,
            ),
            SizedBox(
              width: 10,
            ),
            Consumer<AddressProvider>(
              builder: (context, addressProvider, child) {
                return Text(
                  addressProvider.selectedAddress != null
                      ? "${addressProvider.selectedAddress!.street}, ${addressProvider.selectedAddress!.city}, ${addressProvider.selectedAddress!.postalCode}"
                      : "No address selected",
                  style: const TextStyle(fontSize: 16),
                );
              },
            ),
          ],
        )
      ],
    );
  }

  Future<dynamic> selectPayment(
      BuildContext context, List<String> paymentMethods) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  Text(
                    "Select Payment Method",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            // List of payment methods
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(paymentMethods[index]),
                    leading: const Icon(Icons.payment),
                    onTap: () {
                      // Update selected payment method and close the bottom sheet
                      Provider.of<PaymentProvider>(context, listen: false)
                          .selectPaymentMethod(paymentMethods[index]);
                      Navigator.pop(context); // Close the bottom sheet
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectAddress(BuildContext context, String selectedAddress) {
    final addressProvider =
        Provider.of<AddressProvider>(context, listen: false);

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Select Address",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              if (addressProvider.addresses.isEmpty)
                const Center(child: Text("No addresses available."))
              else
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: addressProvider.addresses.length,
                  itemBuilder: (context, index) {
                    final address = addressProvider.addresses[index];
                    return ListTile(
                      title: Text(
                        "${address.street}, ${address.city}, ${address.postalCode}",
                      ),
                      subtitle: Text(address.state),
                      onTap: () {
                        // Set the selected address when tapped
                        addressProvider.selectAddress(address);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
            ],
          ),
        );
      },
    ).then((selected) {
      if (selected != null) {
        // Update the selected address after modal closes
        setState(() {
          selectedAddress = selected;
        });
      }
    });
  }
}








