// import 'package:flutter/material.dart';
// import 'package:anzam_app/cmn.dart';

// class NewScreen extends StatefulWidget {
//   final String name;
//   final String image;
//   final int price;
//   final int index;

//   const NewScreen(
//       {super.key,
//       required this.name,
//       required this.image,
//       required this.price,
//       required this.index});
//   @override
//   _NewScreenState createState() => _NewScreenState();
// }

// class _NewScreenState extends State<NewScreen> with TickerProviderStateMixin {
//   List<ProductScreen> cart = [productui[1], productui[2], productui[0]];

//   final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
//   PageController _controller = PageController(initialPage: 0, keepPage: false);
//   late Animation<double> cartContainerSize;
//   late Animation<double> dropZoneSize;
//   bool isDragging = false;
//   late AnimationController animationController;
//   late AnimationController dropZoneAnimation;
//   static const kDefaultPadding = 20.0;
//   bool iscontainerOpened = false;
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     animationController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 3));
//     dropZoneAnimation =
//         AnimationController(vsync: this, duration: const Duration(seconds: 3));
//     calculateCart();
//   }

//   double cartTotal = 0.0;
//   void calculateCart() {
//     double total = 0.0;
//     for (var i = 0; i < cart.length; i++) {
//       total += cart[i].price;
//     }
//     setState(() {
//       cartTotal = total;
//     });
//     print('Cart Total: $cartTotal');
//   }

//   int count = 1;
//   @override
//   void dispose() {
//     animationController.dispose();
//     dropZoneAnimation.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double defaultcartContainer = 100;
//     double defaultDropZoneSize = 60;
//     cartContainerSize = Tween<double>(begin: defaultcartContainer, end: 250)
//         .animate(
//             CurvedAnimation(parent: animationController, curve: Curves.linear));

//     dropZoneSize = Tween<double>(begin: defaultDropZoneSize, end: 70).animate(
//         CurvedAnimation(parent: dropZoneAnimation, curve: Curves.linear));
//     // CartProvider provider = Provider.of<CartProvider>(context);
//     return Scaffold(
//       appBar: buildAppBar(context,
//           title: 'ITEM DETAILS',
//           leading: IconButton(
//               icon: const Icon(Icons.arrow_back, color: kIconColor),
//               onPressed: () {})),
//       body: Stack(
//         children: [
//           SafeArea(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//               child: Container(
//                 width: double.infinity,
//                 margin: const EdgeInsets.only(bottom: 100),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Product Name
//                     Align(
//                       alignment: Alignment.center,
//                       child: Text(
//                         widget.name,
//                         style: const TextStyle(
//                             fontSize: 24, fontWeight: FontWeight.bold),
//                       ),
//                     ),

//                     const SizedBox(height: kDefaultPadding),

//                     // Product Image
//                     ClipRRect(
//                         borderRadius: BorderRadius.circular(kDefaultPadding),
//                         child: Image.asset(widget.image,
//                             width: size.width - (kDefaultPadding * 1))),

//                     const SizedBox(height: kDefaultPadding),

//                     // Price
//                     Text(
//                       "${widget.price}",
//                       style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.w700,
//                           color: kTextColor),
//                     ),

//                     const SizedBox(height: kDefaultPadding),

//                     // Dropdown List
//                     // Row(
//                     //   children: [
//                     //     Expanded(
//                     //       flex: 3,
//                     //       child: CustomDropDown(
//                     //         ProductScreen: productui[0].colors,
//                     //         hint: 'Color',
//                     //       ),
//                     //     ),
//                     //     const SizedBox(width: kDefaultPadding),
//                     //     Expanded(
//                     //         flex: 2,
//                     //         child: CustomDropDown(
//                     //           ProductScreen: productui[0]
//                     //               .sizes
//                     //               .map((e) => e.toString())
//                     //               .toList(),
//                     //           hint: 'Size',
//                     //         )),
//                     //   ],
//                     // ),

//                     // const SizedBox(height: kDefaultPadding),

//                     // Cart Button
//                     // ElevatedButton(
//                     //     onPressed: () {
//                     //       print("testing");
//                     //       provider.addTocart(
//                     //           image: widget.image,
//                     //           name: widget.name,
//                     //           price: widget.price,
//                     //           quantity: count);
//                     //     },
//                     //     child: const Text("Add to cart")),
//                     CartButton(tapEvent: () {
//                       print("sdfds");
//                       setState(() {
//                         cart.insert(0, productui[0]);
//                         _listKey.currentState?.insertItem(0);
//                         calculateCart();
//                       });
//                       print("odkvf");
//                     }),

//                     const SizedBox(height: kDefaultPadding),

//                     // Description
//                     Text(
//                       productui[0].name,
//                       style: const TextStyle(
//                           color: kTextLightColor,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w700),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           AnimatedOpacity(
//             opacity: isDragging ? 1 : 0,
//             duration: const Duration(seconds: 3),
//             child: Visibility(
//                 child: Container(
//               width: size.width,
//               height: size.height,
//               color: Colors.black.withOpacity(0.2),
//             )),
//           ),
//           Visibility(
//             visible: isDragging,
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                   height: 300,
//                   alignment: Alignment.topCenter,
//                   child: DragTarget<ProductScreen>(
//                     builder: (context, candidateProductScreen,
//                         rejectedProductScreen) {
//                       if (candidateProductScreen.isNotEmpty) {
//                         dropZoneAnimation.forward();
//                       } else {
//                         dropZoneAnimation.reverse();
//                       }
//                       return AnimatedBuilder(
//                         animation: dropZoneAnimation,
//                         builder: ((context, child) {
//                           return Container(
//                             alignment: Alignment.center,
//                             height: dropZoneSize.value,
//                             width: dropZoneSize.value,
//                             transformAlignment: Alignment.center,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(30),
//                                 color: Colors.white),
//                             child: const Icon(Icons.close),
//                           );
//                         }),
//                       );
//                     },
//                     onAccept: (data) {
//                       calculateCart();
//                       setState(() {
//                         isDragging = false;
//                       });
//                     },
//                   )),
//             ),
//           ),
//           AnimatedBuilder(
//               animation: animationController,
//               builder: (context, index) {
//                 return _buildCartContainer();
//               })
//         ],
//       ),
//     );
//   }

//   Widget _buildCartContainer() {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Container(
//         width: double.infinity,
//         height: cartContainerSize.value,
//         decoration: BoxDecoration(
//             borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(kDefaultPadding * 1.5),
//                 topRight: Radius.circular(kDefaultPadding * 1.5)),
//             boxShadow: [
//               BoxShadow(
//                   blurRadius: 6,
//                   offset: const Offset(0, 0),
//                   color: Colors.black.withAlpha(16))
//             ],
//             color: Colors.white),
//         padding: const EdgeInsets.all(kDefaultPadding),
//         child: Stack(children: [
//           PageView.builder(
//               controller: _controller,
//               itemCount: cart.length,
//               itemBuilder: (context, index) => AnimatedOpacity(
//                     duration: const Duration(seconds: 3 * 3),
//                     opacity:
//                         (iscontainerOpened && animationController.isCompleted)
//                             ? 1
//                             : 0,
//                     child: Visibility(
//                       visible:
//                           iscontainerOpened && animationController.isCompleted,
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                               flex: 1,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(20),
//                                 child: Image.asset(
//                                   cart[index].image,
//                                   fit: BoxFit.cover,
//                                 ),
//                               )),
//                           const SizedBox(
//                             width: kDefaultPadding,
//                           ),
//                           Expanded(
//                             flex: 2,
//                             child: Column(
//                               children: [
//                                 Text(
//                                   cart[index].name,
//                                   style: const TextStyle(
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: kDefaultPadding / 4,
//                                 ),
//                                 Text(
//                                   "\$${cart[index].price}",
//                                   style: const TextStyle(
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   )),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: 50,
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 4,
//                     child: AnimatedList(
//                       key: _listKey,
//                       initialItemCount: cart.length,
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index, animation) =>
//                           _buildCartItem(
//                               context, cart[index], animation, index),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: kDefaultPadding,
//                   ),
//                   Expanded(
//                       flex: 2,
//                       child: RichText(
//                           text: TextSpan(children: [
//                         const TextSpan(
//                             text: "Total\n",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 color: kTextLightColor,
//                                 fontSize: 14)),
//                         TextSpan(
//                             text: "\$$cartTotal",
//                             style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w700,
//                                 color: kTextLightColor))
//                       ]))),
//                   InkWell(
//                     onTap: () {
//                       setState(() {
//                         iscontainerOpened = false;
//                       });
//                       animationController.reverse();
//                     },
//                     child: Container(
//                         width: 50,
//                         height: 50,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(25),
//                             color: kPrimaryColor),
//                         alignment: Alignment.center,
//                         child: const Icon(Icons.arrow_circle_down)),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ]),
//       ),
//     );
//   }

//   Widget _buildCartItem(BuildContext context, ProductScreen cartItem,
//       Animation<double> animation, int index) {
//     return SizeTransition(
//       sizeFactor: animation,
//       axis: Axis.horizontal,
//       child: LongPressDraggable(
//         data: cart[0],
//         onDragStarted: () {
//           cart.removeAt(index);
//           setState(() {
//             isDragging = true;
//           });
//           _listKey.currentState!.removeItem(
//               index,
//               (context, animation) => FadeTransition(
//                   opacity: CurvedAnimation(
//                       parent: animation, curve: const Interval(0.5, 1.0))));
//         },
//         onDraggableCanceled: (velocity, offset) {
//           setState(() {
//             isDragging = false;
//           });
//           cart.insert(index, cartItem);
//           _listKey.currentState!.insertItem(index);
//         },
//         // dragAncho,
//         feedback: FractionalTranslation(
//           translation: const Offset(-0.5, -0.5),
//           child: SizedBox(
//             width: 60,
//             height: 60,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(30),
//               child: Image.asset(cartItem.image),
//             ),
//           ),
//         ),
//         child: GestureDetector(
//           onTap: () {
//             if (!iscontainerOpened) {
//               _controller = PageController(initialPage: index, keepPage: false);
//             }
//             setState(() {
//               iscontainerOpened = true;
//             });
//             animationController.forward();

//             if (_controller.hasClients) {
//               _controller.animateToPage(index,
//                   duration: const Duration(seconds: 3),
//                   curve: Curves.elasticInOut);
//             }
//           },
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(50),
//               child: Image.asset(cartItem.image),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// AppBar buildAppBar(BuildContext context,
//     {required String title, List<Widget>? actions, required Widget leading}) {
//   return AppBar(
//     backgroundColor: Colors.transparent,
//     elevation: 0,
//     title: Text(
//       title,
//       style: const TextStyle(
//           color: kTextLightColor, fontSize: 18, fontWeight: FontWeight.w700),
//     ),
//     centerTitle: false,
//     leading: leading,
//   );
// }

// // class CustomDropDown extends StatelessWidget {
// //   const CustomDropDown({Key? key, required this.hint, required this.ProductScreen})
// //       : super(key: key);

// //   final String hint;
// //   final List<String> ProductScreen;

// //   @override
// //   Widget build(BuildContext context) {
// //     return DropDownContainer(
// //       child: DropdownButton<String>(
// //         underline: Container(),
// //         hint: Text(hint),
// //         ProductScreen: ProductScreen.map((String value) {
// //           return new DropdownMenuItem<String>(
// //             value: value,
// //             child: new Text(value),
// //           );
// //         }).toList(),
// //         onChanged: (_) {},
// //       ),
// //     );
// //   }
// // }

// class DropDownContainer extends StatelessWidget {
//   const DropDownContainer({Key? key, required this.child}) : super(key: key);

//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(kDefaultPadding * 2.5),
//           border: Border.all(color: kIconColor)),
//       padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//       child: child,
//     );
//   }
// }

// // class ProductScreen {
// //   final int id;
// //   final String name;
// //   final String brand;
// //   final String description;
// //   final List<String> colors;
// //   final List<int> sizes;
// //   final String image;
// //   final double price;

// //   ProductScreen({
// //     required this.id,
// //     required this.brand,
// //     required this.name,
// //     required this.description,
// //     required this.colors,
// //     required this.sizes,
// //     required this.image,
// //     required this.price,
// //   });
// // }

// // // demo places

// // List<ProductScreen> productui = [
// //   ProductScreen(
// //       id: 1,
// //       brand: 'Nike',
// //       name: 'SKID GRIP NAVY',
// //       description:
// //           'First introduced in 1979 for elite handball players, these shoes are now beloved for their classic style. This version is built with a nubuck suede upper for a supple feel. A soft gum rubber outsole keeps them true to their vintage roots.',
// //       colors: ['Red', 'Green', 'Blue'],
// //       sizes: [40, 32, 35],
// //       image: 'assets/images/Item_1@2x.png',
// //       price: 49.00),
// //   ProductScreen(
// //       id: 2,
// //       brand: 'Nike',
// //       name: 'GRIP NAVY',
// //       description:
// //           'First introduced in 1979 for elite handball players, these shoes are now beloved for their classic style. This version is built with a nubuck suede upper for a supple feel. A soft gum rubber outsole keeps them true to their vintage roots.',
// //       colors: ['Red', 'Green', 'Blue'],
// //       sizes: [40, 32, 35],
// //       image: 'assets/images/Item_2@2x.png',
// //       price: 30.00),
// //   ProductScreen(
// //       id: 3,
// //       brand: 'Nike',
// //       name: 'NON GRIP NAVY',
// //       description:
// //           'First introduced in 1979 for elite handball players, these shoes are now beloved for their classic style. This version is built with a nubuck suede upper for a supple feel. A soft gum rubber outsole keeps them true to their vintage roots.',
// //       colors: ['Red', 'Green', 'Blue'],
// //       sizes: [40, 32, 35],
// //       image: 'assets/images/Item_3@2x.png',
// //       price: 50.00),
// //   ProductScreen(
// //       id: 4,
// //       brand: 'Nike',
// //       name: 'DIGITAL SPORTS WATCH',
// //       description:
// //           'First introduced in 1979 for elite handball players, these shoes are now beloved for their classic style. This version is built with a nubuck suede upper for a supple feel. A soft gum rubber outsole keeps them true to their vintage roots.',
// //       colors: ['Red', 'Green', 'Blue'],
// //       sizes: [40, 32, 35],
// //       image: 'assets/images/Item_4@2x.png',
// //       price: 35.00),
// // ];
// class CartButton extends StatelessWidget {
//   const CartButton({
//     required this.tapEvent,
//   });
//   static const kPrimaryColor = Color(0XFFC96154);
//   final GestureTapCallback tapEvent;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: tapEvent,
//       borderRadius: BorderRadius.circular(30),
//       child: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           color: kPrimaryColor,
//         ),
//         padding: const EdgeInsets.symmetric(vertical: 20),
//         alignment: Alignment.center,
//         child: const Text(
//           'ADD TO CART',
//           style: TextStyle(
//               color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
