// import 'package:flutter/material.dart';
// import 'package:shopping_app/model/CategoryModel.dart';
// import 'package:shopping_app/responsive.dart';
// import 'package:shopping_app/shimmer.dart';

// class CategoryUI extends StatefulWidget {
//   const CategoryUI({Key? key}) : super(key: key);

//   @override
//   State<CategoryUI> createState() => _CategoryUIState();
// }

// class _CategoryUIState extends State<CategoryUI> {
//   late Future<List<CategoryModel>> categories;

//   @override
//   void initState() {
//     super.initState();
//     categories = loadData();
//   }

//   Future<List<CategoryModel>> loadData() async {
//     await Future.delayed(const Duration(seconds: 5), () {});
//     return List.of(Categoryui);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: categories,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return GridView.builder(
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: Responsive.isDesktop(context) ? 8 : 4,
//               mainAxisSpacing: 8,
//             ),
//             padding: EdgeInsets.zero,
//             itemCount: 2, // You can set a placeholder item count
//             itemBuilder: (BuildContext context, index) {
//               return Shimmereffect(context);
//             },
//           );
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else {
//           List<CategoryModel> foods = snapshot.data as List<CategoryModel>;

//           return GridView.builder(
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: Responsive.isDesktop(context) ? 8 : 4,
//               mainAxisSpacing: 8,
//             ),
//             padding: EdgeInsets.zero,
//             itemCount: foods.length,
//             itemBuilder: (BuildContext context, index) {
//               return buildFood(foods[index], context);
//             },
//           );
//         }
//       },
//     );
//   }

//   Widget Shimmereffect(context) {
//     return Container(
//       constraints: const BoxConstraints(
//         maxHeight: 70,
//       ),
//       child: Column(
//         children: [
//           Container(
//             constraints: const BoxConstraints(
//               minHeight: 45,
//               minWidth: 45,
//               maxHeight: 60,
//               maxWidth: 60,
//             ),
//             child: ShimmerWidget.circular(
//               width: 60,
//               height: 60,
//             ),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Expanded(
//             child: ShimmerWidget.rectangular(
//               width: MediaQuery.of(context).size.width * 0.2,
//               height: 10,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Widget buildFood(CategoryModel food, context) {
//   //   return GestureDetector(
//   //     onTap: () {
//   //       final selectedCategory = food.category;
//   //       switch (selectedCategory) {
//   //         case 'category1':
//   //           Navigator.push(
//   //             context,
//   //             MaterialPageRoute(
//   //               builder: (context) => Man(),
//   //             ),
//   //           );
//   //           break;
//   //         case 'category2':
//   //           // Navigator.push(
//   //           //   context,
//   //           //   MaterialPageRoute(
//   //           //     builder: (context) => Women(),
//   //           //   ),
//   //           // );
//   //           break;
//   //         case 'category3':
//   //           Navigator.push(
//   //             context,
//   //             MaterialPageRoute(
//   //               builder: (context) => Shop(),
//   //             ),
//   //           );
//   //           break;
//   //         case 'category5':
//   //           Navigator.push(
//   //             context,
//   //             MaterialPageRoute(
//   //               builder: (context) => Gadgets(),
//   //             ),
//   //           );
//   //           break;
//   //         case 'category6':
//   //           Navigator.push(
//   //             context,
//   //             MaterialPageRoute(
//   //               builder: (context) => Furniture(),
//   //             ),
//   //           );
//   //           break;
//   //         case 'category8':
//   //           Navigator.push(
//   //             context,
//   //             MaterialPageRoute(
//   //               builder: (context) => SeeAll(),
//   //             ),
//   //           );
//   //           break;
//   //         default:
//   //           Navigator.push(
//   //             context,
//   //             MaterialPageRoute(
//   //               builder: (context) => Home(),
//   //             ),
//   //           );
//   //           break;
//   //       }
//   //     },
//   //     child: Container(
//   //       constraints: const BoxConstraints(
//   //         maxHeight: 70,
//   //       ),
//   //       child: Column(
//   //         children: [
//   //           Container(
//   //             constraints: const BoxConstraints(
//   //               minHeight: 45,
//   //               minWidth: 45,
//   //               maxHeight: 60,
//   //               maxWidth: 60,
//   //             ),
//   //             decoration: BoxDecoration(
//   //               color: Colors.blueAccent,
//   //               borderRadius: BorderRadius.circular(70),
//   //               image: DecorationImage(
//   //                 image: AssetImage('assets/images/${food.image}'),
//   //                 fit: BoxFit.cover,
//   //                 scale: 0.9,
//   //               ),
//   //             ),
//   //           ),
//   //           const SizedBox(
//   //             height: 4,
//   //           ),
//   //           Expanded(
//   //             child: Text(
//   //               food.name,
//   //               style: const TextStyle(
//   //                 color: Colors.grey,
//   //                 fontWeight: FontWeight.w500,
//   //               ),
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
// }
