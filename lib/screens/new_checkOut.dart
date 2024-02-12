import 'package:flutter/material.dart';
import 'package:shopping_app/screens/new_category.dart';

class OrderReview extends StatefulWidget {
  const OrderReview({super.key});

  @override
  State<OrderReview> createState() => _OrderReviewState();
}

class _OrderReviewState extends State<OrderReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ///Cart item
              ProductHorizontalview(),

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
                      billing(),
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
            onPressed: () {}, child: const Text("Checkout ${255.0}")),
      ),
    );
  }

  Widget billing() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "SubTotal",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text("\$255.0")
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Shipping Fee",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text("\$5.0")
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tax Fee",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text("\$15.0")
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Order Total",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(
              "\$275.0",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }

  Widget payment() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Payment Method",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text("Change")
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            // Image.asset('assets/images/mastercard1.png')
            Icon(Icons.payment),
            Text(" Paypal")
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Shipping Address",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text("Change")
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Text("Kevin Lad",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        Row(
          children: [
            Icon(
              Icons.phone,
              size: 15,
            ),
            SizedBox(
              width: 10,
            ),
            Text("+91-910-4363701 ")
          ],
        ),
        SizedBox(
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
            Text("South Liana, Maina 87665,USA")
          ],
        )
      ],
    );
  }
}
