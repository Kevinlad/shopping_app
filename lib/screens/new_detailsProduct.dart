import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:shopping_app/component/SelectColor.dart';
import 'package:shopping_app/component/SelectSize.dart';

import '../model/product_model.dart';
import '../provider/cart_provider.dart';
import '../provider/google_sign.dart';
import '../provider/whishlist_provider.dart';
import 'rating_reviw.dart';

class NewDetailScreen extends StatefulWidget {
  final String name;
  final String image;
  final int price;
  final String title;
  const NewDetailScreen(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      required this.title});

  @override
  State<NewDetailScreen> createState() => _NewDetailScreenState();
}

class _NewDetailScreenState extends State<NewDetailScreen> {
  int count = 1;
  bool isInWishlist = false;

  bool isVisible = true;
  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      if (count > 1) {
        count--;
        // Notify the parent widget of the new quantity
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    CartProvider provider = Provider.of<CartProvider>(context);
    WishlistProvider wishlistProvider =
        Provider.of<WishlistProvider>(context, listen: true);

    // Creating the product model from widget data
    Product_Model product = Product_Model(
        name: widget.name,
        image: widget.image,
        price: widget.price,
        title: widget.name);

    // Check if the product is already in the wishlist
    bool isInWishlist = wishlistProvider.isInWishlist(product);

    int generateRandomNumber(int min, int max) {
      final random = Random();
      return min + random.nextInt(max - min + 1); // Ensures it includes the max
    }

    int randomNum = generateRandomNumber(1, 100);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (isInWishlist) {
                  // If already in wishlist, remove it
                  wishlistProvider.removeFromWishlist(product);
                } else {
                  // Otherwise, add it to the wishlist
                  wishlistProvider.addToWishlist(product);
                }
                // Toggle the heart icon state
                isInWishlist = !isInWishlist;
              });
            },
            icon: Icon(
              CupertinoIcons.heart_fill,
              color: isInWishlist ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // ignore: prefer_const_constructors
              child: Stack(
                children: [
                  SizedBox(
                    height: height * 0.5,
                    child:
                        Center(child: Image(image: AssetImage(widget.image))),
                  ),

                  /// Image Slider
                  Positioned(
                    bottom: 20,
                    right: 0,
                    left: 20,
                    child: SizedBox(
                      height: height * 0.08,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (_, __) => const SizedBox(
                          width: 20,
                        ),
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            child: Container(
                              height: height * 0.08,
                              width: 70,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black),
                                  borderRadius: BorderRadius.circular(15)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: const Image(
                                  image: AssetImage(
                                    "assets/images/Item_2_2x.png",
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     IconButton(
                  //         onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                  //     IconButton(
                  //         onPressed: () {},
                  //         icon: const Icon(
                  //           CupertinoIcons.heart_fill,
                  //           color: Colors.red,
                  //         ))
                  //   ],
                  // )
                ],
              ),
            ),
            Container(
              width: 800,
              // width: ,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text("4.8(178)")
                            ],
                          ),
                          Icon(
                            Icons.share,
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.010),
                      Row(
                        children: [
                          Container(
                              height: height * 0.030,
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.amber,
                              ),
                              child: const Center(
                                child: Text(
                                  "25%",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text("5530"),
                          const SizedBox(
                            width: 15,
                          ),
                          Text("${widget.price}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      Text(widget.name),
                      SizedBox(height: height * 0.01),
                      const Row(
                        children: [
                          Text("Status"),
                          SizedBox(
                            width: 15,
                          ),
                          Text("in Stock")
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        children: [
                          const Icon(Icons.turn_right_sharp),
                          Text(widget.title,
                              style: const TextStyle(fontSize: 16)),
                          const Icon(
                            Icons.verified,
                            color: Colors.blue,
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      Container(
                        width: 600,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.black
                                    : Colors.grey.shade400),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Variation",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Row(
                                          children: [
                                            Text("Price"),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              "\$25",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              "\$20",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: height * 0.01),
                                        //Stock
                                        const Row(
                                          children: [
                                            Text("Status"),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text("in Stock ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: height * 0.01),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                    "This is the description of the Product and it take max 4 line"),
                              )
                            ],
                          ),
                        ),
                      ),

                      /// Select Color
                      SizedBox(height: height * 0.01),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Colors",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            "view all",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      const SelectColor(),
                      SizedBox(height: height * 0.01),
                      // Select  Size
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Size",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            "view all",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      SelectSize(),
                      SizedBox(height: height * 0.01),

                      /// Check out button
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                              child: Text("Checkout",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16))),
                        ),
                      ),
                      SizedBox(height: height * 0.01),

                      /// Description
                      const Text(
                        "Description",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: height * 0.01),
                      const ReadMoreText(
                        'The user interface of the app is quite inuitiaive. I was able to navigate and make purchase seamlessly. Great Job!',
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        moreStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        lessStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: height * 0.01),

                      /// Reviews
                      const Divider(color: Colors.black),
                      SizedBox(height: height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Reviews(199)",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RatingReview()));
                            },
                          )
                        ],
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      increment();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey),
                      child: const Center(child: Icon(Icons.add)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "$count",
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      decrement();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black54),
                      child: const Center(child: Icon(CupertinoIcons.minus)),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<GoogleSignInProvider>().addToCart(
                      randomNum.toString(),
                      widget.name,
                      count,
                      widget.price.toDouble(),
                      widget.image);
                },
                child: const Text("Add to Cart"),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: Colors.black,
                    side: const BorderSide(color: Colors.black)),
              )
            ],
          )),
    );
  }

//  provider.addTocart(
//                       image: widget.image,
//                       name: widget.name,
//                       price: widget.price,
//                       quantity: count);
  Widget roundedImage() {
    return GestureDetector(
      child: Container(
        width: 80,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(15)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: const Image(
            image: AssetImage(
              "assets/images/Item_4@2x.png",
            ),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
