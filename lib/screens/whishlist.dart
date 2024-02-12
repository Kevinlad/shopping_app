import 'package:flutter/material.dart';

class Whishlist extends StatefulWidget {
  const Whishlist({super.key});

  @override
  State<Whishlist> createState() => _WhishlistState();
}

class _WhishlistState extends State<Whishlist> {
  @override
  Widget build(BuildContext context) {
    // FavouriteProvider favouriteProvider =
    //     Provider.of<FavouriteProvider>(context);
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios),
          title: const Text("WhishList"),
        ),
        body:
            //  favouriteProvider.selectedItem.isEmpty
            //     ?
            Center(
          child: Column(
            children: [
              Image.asset(
                "assets/images/Animation1.gif",
                height: 325.0,
                width: 325.0,
              ),
              const Text("Your WhishList is Empty!"),
            ],
          ),
        )
        // : ListView.builder(
        //     itemCount: favouriteProvider.selectedItem.length,
        //     scrollDirection: Axis.vertical,
        //     itemBuilder: (_, int index) {
        //       return Column(
        //         children: [
        //           Center(
        //               child: SizedBox(
        //             child: Padding(
        //               padding: const EdgeInsets.only(left: 20.0, right: 20),
        //               child: Expanded(
        //                 child: Container(
        //                   height: 145,
        //                   decoration: BoxDecoration(
        //                       color: Colors.white,
        //                       borderRadius: BorderRadius.circular(20)),
        //                   child: Row(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     mainAxisAlignment: MainAxisAlignment.start,
        //                     children: [
        //                       Container(
        //                         height: 100,
        //                         width: 120,
        //                         decoration: BoxDecoration(
        //                             // color: Colors.black,
        //                             borderRadius: const BorderRadius.only(
        //                                 bottomLeft: Radius.circular(20),
        //                                 topLeft: Radius.circular(20)),
        //                             image: DecorationImage(
        //                                 image: AssetImage(favouriteProvider
        //                                     .selectedItem[index].image),
        //                                 fit: BoxFit.contain)),
        //                       ),
        //                       Padding(
        //                         padding: const EdgeInsets.only(right: 7.0),
        //                         child: Column(
        //                           children: [
        //                             Text(
        //                               favouriteProvider
        //                                   .selectedItem[index].name,
        //                               style: const TextStyle(
        //                                   fontSize: 17,
        //                                   color: Colors.grey,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                             const Text(
        //                               "Lorem Ipsum, Lorem Ipsum is simply ",
        //                               style: TextStyle(
        //                                   fontSize: 10, color: Colors.grey),
        //                             ),
        //                             const Padding(
        //                               padding: EdgeInsets.only(right: 25.0),
        //                               child: Text(
        //                                 " dummy text of the printing and",
        //                                 style: TextStyle(
        //                                     fontSize: 10, color: Colors.grey),
        //                               ),
        //                             ),
        //                             const Padding(
        //                               padding: EdgeInsets.only(right: 65.0),
        //                               child: Text(
        //                                 "typesetting industry.",
        //                                 style: TextStyle(
        //                                     fontSize: 10, color: Colors.grey),
        //                               ),
        //                             ),
        //                             const SizedBox(
        //                               height: 10,
        //                             ),
        //                             Row(
        //                               children: [
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(
        //                                       right: 35.0),
        //                                   child: Text(
        //                                     "${favouriteProvider.selectedItem[index].price}",
        //                                     style: const TextStyle(
        //                                         fontSize: 17,
        //                                         color: Colors.red,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 ),
        //                                 const SizedBox(
        //                                   width: 10,
        //                                 ),
        //                                 const Text(
        //                                   "-7%",
        //                                   style: TextStyle(
        //                                       color: Colors.grey,
        //                                       fontSize: 15,
        //                                       fontWeight: FontWeight.bold),
        //                                 )
        //                               ],
        //                             ),
        //                             const SizedBox(
        //                               height: 10,
        //                             ),
        //                             const Row(
        //                               mainAxisAlignment:
        //                                   MainAxisAlignment.start,
        //                               children: [
        //                                 Padding(
        //                                   padding:
        //                                       EdgeInsets.only(right: 100.0),
        //                                   child: Icon(
        //                                     Icons.delete,
        //                                     color: Colors.grey,
        //                                   ),
        //                                 ),
        //                                 Padding(
        //                                   padding:
        //                                       EdgeInsets.only(right: 20.0),
        //                                   child: Icon(
        //                                     Icons.add_shopping_cart_rounded,
        //                                     color: Colors.blue,
        //                                   ),
        //                                 )
        //                               ],
        //                             )
        //                           ],
        //                         ),
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           )),
        //           const SizedBox(
        //             height: 10,
        //           ),
        //           Container(height: 2, width: 300, color: Colors.black),
        //           const SizedBox(
        //             height: 20,
        //           )
        //         ],
        //       );
        //     }),
        );
  }
}
