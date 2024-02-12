import 'package:shimmer/shimmer.dart';

import 'package:flutter/material.dart';

import 'model/CategoryModel.dart';

// class ShimmmerEffect extends StatefulWidget {
//   const ShimmmerEffect({super.key});

//   @override
//   State<ShimmmerEffect> createState() => _ShimmmerEffectState();
// }

// class _ShimmmerEffectState extends State<ShimmmerEffect> {
//   List<CategoryModel> foods = [];
//   List<Food> allfood = [
//     Food(
//         urlImage:
//             "https://wallpapers.com/images/hd/naruto-pictures-3n3frmm4xs2y0nvv.jpg",
//         title: "kdl;dsc",
//         description: "kadcsdkl cnad km akjdwe kclknsdcw lcm lcmskc"),
//     Food(
//         urlImage:
//             "https://wallpapers.com/images/hd/naruto-pictures-3n3frmm4xs2y0nvv.jpg",
//         title: "kdl;dsc",
//         description: "kadcsdkl cnad km akjdwe kclknsdcw lcm lcmskc"),
//     Food(
//         urlImage:
//             "https://wallpapers.com/images/hd/naruto-pictures-3n3frmm4xs2y0nvv.jpg",
//         title: "kdl;dsc",
//         description: "kadcsdkl cnad km akjdwe kclknsdcw lcm lcmskc"),
//     Food(
//         urlImage:
//             "https://wallpapers.com/images/hd/naruto-pictures-3n3frmm4xs2y0nvv.jpg",
//         title: "kdl;dsc",
//         description: "kadcsdkl cnad km akjdwe kclknsdcw lcm lcmskc"),
//     Food(
//         urlImage:
//             "https://wallpapers.com/images/hd/naruto-pictures-3n3frmm4xs2y0nvv.jpg",
//         title: "kdl;dsc",
//         description: "kadcsdkl cnad km akjdwe kclknsdcw lcm lcmskc")
//   ];
//   bool isLoading = false;
//   Future loadData() async {
//     foods = List.of(Categoryui);
//     setState(() => isLoading = true);
//     await Future.delayed(
//         const Duration(
//           seconds: 5,
//         ),
//         () {});
//     foods = List.of(Categoryui);
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loadData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: Responsive.isDesktop(context) ? 8 : 4,
//           mainAxisSpacing: 8),
//       padding: EdgeInsets.zero,
//       itemCount: Categoryui.length,
//       itemBuilder: (BuildContext context, index) {
//         if (isLoading) {
//           return Shimmereffect();
//         } else {
//           final food = foods[index];

//           return buildFood(food);
//         }
//       },
//     );
// return Scaffold(
//     body: ListView.builder(
//         itemCount: foods.length,
//         itemBuilder: ((context, index) {
// if (isLoading) {
//   return Shimmereffect();
// } else {
//   final food = foods[index];

//   return buildFood(food);
// }
//         })));
// }

// Widget buildFood(CategoryModel food) => GestureDetector(
//       onTap: () {
//         final selectedCategory = food.category;
//         switch (selectedCategory) {
//           case 'category1':
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Man(),
//               ),
//             );
//             break;
//           case 'category2':
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Woman(),
//               ),
//             );
//             break;
//           case 'category3':
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Shop(),
//               ),
//             );
//             break;
//           case 'category5':
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Gadgets(),
//               ),
//             );
//             break;
//           case 'category6':
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Furniture(),
//               ),
//             );
//             break;
//           case 'category8':
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => SeeAll(),
//               ),
//             );
//             break;
//           default:
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Home(),
//               ),
//             );
//             break;
//         }
//   },
//   child: Container(
//     constraints: const BoxConstraints(
//       maxHeight: 70,
//     ),
//     child: Column(
//       children: [
//         Container(
//           constraints: const BoxConstraints(
//             minHeight: 45,
//             minWidth: 45,
//             maxHeight: 60,
//             maxWidth: 60,
//           ),
//           decoration: BoxDecoration(
//               color: Colors.blueAccent,
//               borderRadius: BorderRadius.circular(70),
//               image: DecorationImage(
//                   image: AssetImage('assets/images/${food.image}'),
//                   fit: BoxFit.cover,
//                   scale: 0.9)),
//         ),
//         const SizedBox(
//           height: 4,
//         ),
//         Expanded(
//             child: Text(
//           food.name,
//           style: const TextStyle(
//               color: Colors.grey, fontWeight: FontWeight.w500),
//         ))
//       ],
//     ),
//   ),
// );
// ListTile(
//       leading: CircleAvatar(
//         radius: 32,
//         backgroundImage: NetworkImage(food.urlImage),
//       ),
//       title: Text(
//         food.title,
//         style: TextStyle(fontSize: 16),
//       ),
//       subtitle: Text(food.description, style: TextStyle(fontSize: 16)),
//     );
// Widget Shimmereffect() {
//   return Container(
//     constraints: const BoxConstraints(
//       maxHeight: 70,
//     ),
//     child: Column(
//       children: [
//         Container(
//           constraints: const BoxConstraints(
//             minHeight: 45,
//             minWidth: 45,
//             maxHeight: 60,
//             maxWidth: 60,
//           ),
//           child: ShimmerWidget.circular(
//             width: 60,
//             height: 60,
//           ),
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         Expanded(
//           child: ShimmerWidget.rectangular(
//             width: MediaQuery.of(context).size.width * 0.2,
//             height: 16,
//           ),
//         ),
//       ],
//     ),
//   );

// Widget Shimmereffect() {
//   return ShimmerWidget.circular(
//     width: 64,
//     height: 64,
//   );
//   ListTile(
// leading: ShimmerWidget.circular(
//   width: 64,
//   height: 64,
// ),
//     title: ShimmerWidget.rectangular(
//       height: 16,
//       width: MediaQuery.of(context).size.width * 0.1,
//     ),
//     subtitle: ShimmerWidget.rectangular(height: 14),
//   );
//   }
// }

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final ShapeBorder shapeBorder;

  ShimmerWidget.rectangular(
      {this.width = double.infinity, required this.height})
      : this.shapeBorder =
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));
  ShimmerWidget.circular(
      {required this.width,
      required this.height,
      this.shapeBorder = const CircleBorder()});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        width: width,
        height: height,
        // color: Colors.grey,
        decoration:
            ShapeDecoration(shape: shapeBorder, color: Colors.grey[400]!),
      ),
    );
  }
}
