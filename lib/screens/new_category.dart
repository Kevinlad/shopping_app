import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewSubCaetgory extends StatefulWidget {
  const NewSubCaetgory({super.key});

  @override
  State<NewSubCaetgory> createState() => _NewSubCaetgoryState();
}

class _NewSubCaetgoryState extends State<NewSubCaetgory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// title
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const Text("Store",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ],
              ),

              ///BAnner
              SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    'https://static.vecteezy.com/system/resources/previews/002/453/533/non_2x/big-sale-discount-banner-template-promotion-illustration-free-vector.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: 30),

              /// Product View
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sports Shoe",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "view all",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              SizedBox(
                  height: 120,
                  child: ListView.separated(
                      itemBuilder: (_, index) {
                        return productView();
                      },
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: 4)),
              SizedBox(height: 30),
              SizedBox(
                  height: 120,
                  child: ListView.separated(
                      itemBuilder: (_, index) {
                        return productView();
                      },
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: 4)),
              SizedBox(height: 30),
              SizedBox(
                  height: 120,
                  child: ListView.separated(
                      itemBuilder: (_, index) {
                        return productView();
                      },
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: 4))

              // productView()
            ],
          ),
        ),
      ),
    );
  }

  Widget productView() {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white38),
      child: Row(
        children: [
          Container(
            height: 120,
            padding: const EdgeInsets.all(2),
            child: Stack(
              children: [
                // Image
                SizedBox(
                  height: 120,
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
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.amber,
                          ),
                          child: const Center(
                            child: Text(
                              "25%",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),

                    // Favourite Icon Button

                    Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(CupertinoIcons.heart_fill,
                                size: 25, color: Colors.red)))
                  ]),
                ),
              ],
            ),
          ),

          ///// Details

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Blue Nike Shoes",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              // const SizedBox(
              //   height: 6,
              // ),
              const Row(
                children: [
                  Text("Nike",
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                  Icon(
                    Icons.verified,
                    color: Colors.blue,
                    size: 16,
                  )
                ],
              ),
              // const SizedBox(
              //   height: 6,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('\$255.0 - \$355.0',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: Colors.black),
                    child: const Icon(Icons.add, color: Colors.white),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class ProductHorizontalview extends StatefulWidget {
  const ProductHorizontalview({super.key});

  @override
  State<ProductHorizontalview> createState() => _ProductHorizontalviewState();
}

class _ProductHorizontalviewState extends State<ProductHorizontalview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white38),
      child: Row(
        children: [
          Container(
            height: 120,
            padding: const EdgeInsets.all(2),
            child: Stack(
              children: [
                // Image
                SizedBox(
                  height: 120,
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
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.amber,
                          ),
                          child: const Center(
                            child: Text(
                              "25%",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),

                    // Favourite Icon Button

                    Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(CupertinoIcons.heart_fill,
                                size: 25, color: Colors.red)))
                  ]),
                ),
              ],
            ),
          ),

          ///// Details

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Blue Nike Shoes",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              // const SizedBox(
              //   height: 6,
              // ),
              const Row(
                children: [
                  Text("Nike",
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                  Icon(
                    Icons.verified,
                    color: Colors.blue,
                    size: 16,
                  )
                ],
              ),
              // const SizedBox(
              //   height: 6,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('\$255.0 - \$355.0',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: Colors.black),
                    child: const Icon(Icons.add, color: Colors.white),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
