import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/cart_provider.dart';
import 'package:shopping_app/screens/new_checkOut.dart';

class NewCartScreen extends StatefulWidget {
  const NewCartScreen({super.key});

  @override
  State<NewCartScreen> createState() => _NewCartScreenState();
}

class _NewCartScreenState extends State<NewCartScreen> {
  @override
  Widget build(BuildContext context) {
    CartProvider provider = Provider.of<CartProvider>(context);
    int total = provider.totalprice();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView.separated(
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
                            borderRadius: BorderRadius.circular(15)),
                        child: Image.asset(
                          provider.cartList[index].image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const SizedBox(
                          //   height: 6,
                          // ),
                          const Row(
                            children: [
                              Text("Nike",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey)),
                              Icon(
                                Icons.verified,
                                color: Colors.blue,
                                size: 16,
                              )
                            ],
                          ),
                          Text(
                            provider.cartList[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                          // const SizedBox(
                          //   height: 6,
                          // ),
                          /// Attribute

                          Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "Color",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey.shade400)),
                            const TextSpan(
                                text: " Green",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "Size",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey.shade400)),
                            const TextSpan(
                                text: " UK 08",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ])),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 28,
                                    width: 28,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.grey),
                                    child: const Center(
                                        child: Icon(CupertinoIcons.minus)),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "${provider.cartList[index].quantity}",
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    height: 28,
                                    width: 28,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.blue),
                                    child: const Center(
                                        child: Icon(CupertinoIcons.add)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 120,
                              ),
                              Text(
                                "${provider.cartList[index].price}",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              );
            },
            separatorBuilder: (_, __) => const SizedBox(
              height: 20,
            ),
            itemCount: provider.cartList.length,
            shrinkWrap: true,
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const OrderReview()));
        },
        child: const Text("Checkout \$252"),
      ),
    );
  }
}
