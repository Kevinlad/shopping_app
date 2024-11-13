import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/cart_provider.dart';
import 'package:shopping_app/screens/new_checkOut.dart';

import '../provider/google_sign.dart';

class NewCartScreen extends StatefulWidget {
  const NewCartScreen({super.key});

  @override
  State<NewCartScreen> createState() => _NewCartScreenState();
}

class _NewCartScreenState extends State<NewCartScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch cart items when the screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GoogleSignInProvider>(context, listen: false)
          .fetchCartItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    GoogleSignInProvider provider = Provider.of<GoogleSignInProvider>(context);
    int total = provider.cartList
        .fold(0, (sum, item) => sum + (item.quantity * item.price).toInt());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: provider.cartList.isEmpty
              ? const Center(child: Text("No items in the cart"))
              : ListView.separated(
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.asset(
                                provider.cartList[index].image,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        provider.cartList[index].name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            // Remove the item from the cart
                                            provider.removeFromCart(
                                                provider.cartList[index]);
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Quantity: ",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "${provider.cartList[index].quantity}",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              // Decrease quantity action
                                              setState(() {
                                                if (provider.cartList[index]
                                                        .quantity >
                                                    1) {
                                                  provider
                                                      .cartList[index].quantity;
                                                }
                                              });
                                            },
                                            child: Container(
                                              height: 28,
                                              width: 28,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Colors.grey,
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  CupertinoIcons.minus,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            "${provider.cartList[index].quantity}",
                                          ),
                                          const SizedBox(width: 10),
                                          GestureDetector(
                                            onTap: () {
                                              // Increase quantity action
                                              setState(() {
                                                provider
                                                    .cartList[index].quantity;
                                              });
                                            },
                                            child: Container(
                                              height: 28,
                                              width: 28,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Colors.blue,
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  CupertinoIcons.add,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "\$${provider.cartList[index].price * provider.cartList[index].quantity}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 20),
                  itemCount: provider.cartList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OrderReview(
                        total: total,
                        cartItems: provider.cartList,
                      )),
            );
          },
          child: Text("Checkout \$${total}"),
        ),
      ),
    );
  }
}
