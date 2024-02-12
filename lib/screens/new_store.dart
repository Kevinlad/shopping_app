import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/screens/new_allBrand.dart';

import 'new_detailsProduct.dart';

class NewStore extends StatefulWidget {
  const NewStore({super.key});

  @override
  State<NewStore> createState() => _NewStoreState();
}

class _NewStoreState extends State<NewStore> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: Colors.white54,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Store",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Stack(
                              children: [
                                const Icon(Icons.shopping_cart),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          Colors.red, // Change color if needed
                                    ),
                                    width: 8,
                                    height: 8,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                            ),
                            onSubmitted: (text) {
                              // Handle search here
                            },
                          ),
                        ),

                        // featured brands
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Featured Brands",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const NewBrand()));
                              },
                              child: const Text("view All"),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        /// Brands
                        ///
                        GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              mainAxisExtent: 80,
                            ),
                            itemCount: 4,
                            itemBuilder: (_, index) {
                              return Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Container(
                                    height: 62,
                                    width: 36,
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: const Row(
                                      children: [
                                        Image(
                                            image: AssetImage(
                                                'assets/images/icon-1.png')),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Nike",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              "256 Products",
                                              style: TextStyle(fontSize: 12),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ));
                            }),
                        // Container(
                        //     decoration: BoxDecoration(
                        //         border: Border.all(color: Colors.black),
                        //         borderRadius: BorderRadius.circular(20)),
                        //     child: Container(
                        //       height: 62,
                        //       width: 36,
                        //       padding: EdgeInsets.all(15),
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(50)),
                        //       child: Row(
                        //         children: [
                        //           Image(
                        //               image:
                        //                   AssetImage('assets/images/icon-1.png')),
                        //           SizedBox(width: 20),
                        //           Column(
                        //             crossAxisAlignment: CrossAxisAlignment.start,
                        //             children: [
                        //               Text(
                        //                 "Nike",
                        //                 style: TextStyle(
                        //                     fontWeight: FontWeight.bold,
                        //                     fontSize: 12),
                        //               ),
                        //               Text(
                        //                 "256 Products",
                        //                 style: TextStyle(fontSize: 12),
                        //               )
                        //             ],
                        //           )
                        //         ],
                        //       ),
                        //     )),
                      ],
                    ),
                  ),
                  //// Tabs tutiorial
                  bottom: TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.blueGrey[200]!,
                      labelColor: Colors.grey,
                      unselectedLabelColor: Colors.black,
                      tabs: const [
                        Tab(
                          child: Text("Sports"),
                        ),
                        // Tab(
                        //   child: Text("Furniture"),
                        // ),
                        // Tab(
                        //   child: Text("Electronics"),
                        // ),
                        // Tab(
                        //   child: Text("Clothes"),
                        // ),
                        // Tab(
                        //   child: Text("Cosmetics"),
                        // )
                      ]),
                )
              ];
            },
            body: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              height: 210,
                              width: 400,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Column(
                                children: [
                                  const Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image(
                                          height: 50,
                                          width: 50,
                                          image: AssetImage(
                                              'assets/images/icon-1.png')),
                                      SizedBox(width: 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Nike",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            "256 Products",
                                            style: TextStyle(fontSize: 12),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 116,
                                          width: 96,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: const Center(
                                            child: Image(
                                              image: AssetImage(
                                                'assets/images/Item_1_2xx.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 116,
                                          width: 96,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: const Center(
                                            child: Image(
                                              image: AssetImage(
                                                'assets/images/Item_1_2xx.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 116,
                                          width: 96,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: const Center(
                                            child: Image(
                                              image: AssetImage(
                                                'assets/images/Item_1_2xx.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ])
                                ],
                              ),
                            )),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "You Might Like",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            "view all",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          )
                        ],
                      ),
                      GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            mainAxisExtent: 301,
                          ),
                          itemCount: 4,
                          itemBuilder: (_, index) {
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
                                            'assets/images/Item_1_2xx.png',
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
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Colors.amber,
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    "25%",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )),
                                          ),

                                          // Favourite Icon Button

                                          Positioned(
                                              top: 0,
                                              right: 0,
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                      CupertinoIcons.heart_fill,
                                                      size: 25,
                                                      color: Colors.red)))
                                        ]),
                                      ),
                                      //Details

                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Blue Nike Shoes",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18),
                                              ),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              const Text("Nike",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey)),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text('\$35.54',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 26)),
                                                  Container(
                                                    height: 35,
                                                    width: 35,
                                                    decoration:
                                                        const BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            color:
                                                                Colors.black),
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
                          }),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
