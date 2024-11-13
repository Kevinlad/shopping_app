import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/CategoryModel.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/provider/google_sign.dart';
import 'package:shopping_app/screens/animation.dart';
import 'package:shopping_app/screens/new_allProduct.dart';
import 'package:shopping_app/screens/new_category.dart';
import 'package:shopping_app/screens/new_detailsProduct.dart';
import 'package:shopping_app/screens/order_shipping.dart';

import '../provider/category_provider.dart';
import '../provider/whishlist_provider.dart';

class NewHome extends StatefulWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<GoogleSignInProvider>(context).user;
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final categories = categoryProvider.categories;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/back1.avif', // Provide your image path here
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Consumer<GoogleSignInProvider>(
                        builder: (context, provider, _) {
                          if (provider.name.isEmpty) {
                            // Fetch user data if not fetched yet
                            Future.microtask(() => provider.fetchUserData());
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Good day for shopping",
                                        style: TextStyle(color: Colors.black)),
                                    Text(
                                      "${provider.name} ",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoadingPage()));
                                        },
                                        child: Text("ghvgjh"))
                                  ],
                                ),
                                Stack(
                                  children: [
                                    const Icon(Icons.shopping_cart,
                                        color: Colors.black),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors
                                              .red, // Change color if needed
                                        ),
                                        width: 8,
                                        height: 8,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextField(
                          decoration: InputDecoration(
                              fillColor:
                                  Theme.of(context).colorScheme.secondary,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(20, 8, 20, 8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Search in store',
                              hintStyle: TextStyle(color: Colors.black)),
                          onSubmitted: (text) {
                            // Handle search here
                          },
                        ),
                      ),

                      ///Popular product

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Categories",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const NewSubCaetgory()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 56,
                                      width: 56,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Center(
                                        child: Image(
                                          image: NetworkImage(
                                              categories[index].image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      categories[index].name,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      CarousulSlider(),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Popular Products",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NewAllProduct()));
                                },
                                child: const Text("View All"))
                          ],
                        ),
                      ),
                      const GridviewProduct()

                      /// Gridview
                      ///
                      //       Container(S
                      //         width: 180,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(20),
                      //           boxShadow: [
                      //             BoxShadow(
                      //                 blurRadius: 2,
                      //                 color: Colors.grey[300]!.withOpacity(0.1),
                      //                 offset: const Offset(0, 2))
                      //           ],
                      //         ),
                      //         child: Column(
                      //           children: [
                      //             Container(
                      //               height: 180,
                      //               // padding: const EdgeInsets.all(10),
                      //               child: Stack(children: [
                      //                 /// image of product
                      //                 Image.asset('assets/images/Item_1@2x.png'),

                      //                 /// Sale tag
                      //                 Positioned(
                      //                   top: 12,
                      //                   left: 12,
                      //                   child: Container(
                      //                       height: 25,
                      //                       width: 35,
                      //                       decoration: BoxDecoration(
                      //                         borderRadius: BorderRadius.circular(8),
                      //                         color: Colors.amber,
                      //                       ),
                      //                       child: const Center(
                      //                         child: Text(
                      //                           "25%",
                      //                           style: TextStyle(
                      //                               fontSize: 14,
                      //                               fontWeight: FontWeight.w500),
                      //                         ),
                      //                       )),
                      //                 ),

                      //                 // Favourite Icon Button

                      //                 Positioned(
                      //                     top: 0,
                      //                     right: 0,
                      //                     child: IconButton(
                      //                         onPressed: () {},
                      //                         icon: const Icon(
                      //                             CupertinoIcons.heart_fill,
                      //                             size: 25,
                      //                             color: Colors.red)))
                      //               ]),
                      //             ),
                      //             //Details

                      //             Padding(
                      //               padding: const EdgeInsets.all(10),
                      //               child: Column(
                      //                   crossAxisAlignment: CrossAxisAlignment.start,
                      //                   children: [
                      //                     const Text(
                      //                       "Blue Nike Shoes",
                      //                       style: TextStyle(
                      //                           fontWeight: FontWeight.w700,
                      //                           fontSize: 18),
                      //                     ),
                      //                     const SizedBox(
                      //                       height: 6,
                      //                     ),
                      //                     const Text("Nike",
                      //                         style: TextStyle(
                      //                             fontSize: 18, color: Colors.grey)),
                      //                     const SizedBox(
                      //                       height: 6,
                      //                     ),
                      //                     Row(
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment.spaceBetween,
                      //                       children: [
                      //                         const Text('\$35.54',
                      //                             maxLines: 1,
                      //                             overflow: TextOverflow.ellipsis,
                      //                             style: TextStyle(
                      //                                 fontWeight: FontWeight.bold,
                      //                                 fontSize: 26)),
                      //                         Container(
                      //                           height: 35,
                      //                           width: 35,
                      //                           decoration: const BoxDecoration(
                      //                               borderRadius: BorderRadius.only(
                      //                                 topLeft: Radius.circular(10),
                      //                                 bottomRight:
                      //                                     Radius.circular(10),
                      //                               ),
                      //                               color: Colors.black),
                      //                           child: const Icon(Icons.add,
                      //                               color: Colors.white),
                      //                         )
                      //                       ],
                      //                     )
                      //                   ]),
                      //             )
                      //           ],
                      //         ),
                      //       )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CarousulSlider extends StatefulWidget {
  CarousulSlider({super.key});

  @override
  State<CarousulSlider> createState() => _CarousulSliderState();
}

class _CarousulSliderState extends State<CarousulSlider> {
  final List<String> imgList = [
    'https://c8.alamy.com/comp/FBW7JN/discount-sale-banner-or-label-for-business-promotion-50-percent-off-FBW7JN.jpg',
    'https://static.vecteezy.com/system/resources/previews/002/453/533/non_2x/big-sale-discount-banner-template-promotion-illustration-free-vector.jpg',
    'https://t3.ftcdn.net/jpg/05/07/79/68/360_F_507796863_XOctjfN6VIiHa79bFj7GCg92P9TpELIe.jpg'
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: size.width * 0.833,
            child: SizedBox(
              height: size.height * 0.1625,
              child: CarouselSlider(
                items: imgList.map((item) {
                  return SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 0.01, // Adjust aspect ratio as needed
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    }),
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.map((url) {
            int index = imgList.indexOf(url);
            return Container(
              width: size.width * 0.022,
              height: size.height * 0.01,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Colors.blue
                    : Colors.grey, // Customize the dot colors
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class GridviewProduct extends StatefulWidget {
  const GridviewProduct({super.key});

  @override
  State<GridviewProduct> createState() => _GridviewProductState();
}

class _GridviewProductState extends State<GridviewProduct> {
  late List<bool> _isFavorited;

  @override
  void initState() {
    super.initState();
    // Initialize the list with false, assuming no product is favorited initially
    _isFavorited = List<bool>.filled(productui.length, false);
  }

  // bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          mainAxisExtent: 305,
        ),
        itemCount: productui.length,
        itemBuilder: (_, index) {
          var wishlistProvider = Provider.of<WishlistProvider>(context);
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewDetailScreen(
                            name: productui[index].name,
                            image: productui[index].image,
                            price: productui[index].price,
                            title: productui[index].title,
                          )));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        color: Colors.white.withOpacity(0.4),
                        offset: const Offset(0, 2))
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      // padding: const EdgeInsets.all(10),
                      child: Stack(children: [
                        /// image of product
                        Image.asset(
                          productui[index].image,
                          fit: BoxFit.contain,
                        ),

                        /// Sale tag
                        Positioned(
                          top: 12,
                          left: 12,
                          child: Container(
                              height: 25,
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
                        ),

                        // Favourite Icon Button

                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                // Check if the item is already in the wishlist
                                if (wishlistProvider
                                    .isInWishlist(productui[index])) {
                                  wishlistProvider
                                      .removeFromWishlist(productui[index]);
                                } else {
                                  wishlistProvider
                                      .addToWishlist(productui[index]);
                                }
                              });
                            },
                            icon: Icon(
                              wishlistProvider.isInWishlist(productui[index])
                                  ? CupertinoIcons.heart_fill
                                  : CupertinoIcons.heart,
                              size: 25,
                              color: wishlistProvider
                                      .isInWishlist(productui[index])
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ]),
                    ),
                    //Details

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productui[index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                Text(productui[index].title,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey)),
                                Icon(
                                  Icons.verified,
                                  color: Colors.blue,
                                  size: 16,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${productui[index].price}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      color: Colors.black),
                                  child: const Icon(Icons.add,
                                      color: Colors.white),
                                )
                              ],
                            )
                          ]),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
