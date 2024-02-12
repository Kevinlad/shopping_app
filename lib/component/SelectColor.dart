// import 'package:flutter/material.dart';

// class SelectColor extends StatelessWidget {
//   const SelectColor({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 40,
//         ),
//         Container(
//           constraints: BoxConstraints(
//             maxHeight: 39,
//           ),
//           child: Container(
//             constraints: BoxConstraints(
//               minHeight: 29,
//               minWidth: 29,
//               maxHeight: 35,
//               maxWidth: 32,
//             ),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10), color: Colors.red),
//           ),
//         ),
//         SizedBox(
//           width: 20,
//         ),
//         Container(
//           constraints: BoxConstraints(
//             maxHeight: 39,
//           ),
//           child: Container(
//             constraints: BoxConstraints(
//               minHeight: 29,
//               minWidth: 29,
//               maxHeight: 35,
//               maxWidth: 32,
//             ),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: const Color.fromARGB(255, 122, 152, 202)),
//           ),
//         ),
//         SizedBox(
//           width: 20,
//         ),
//         Container(
//           constraints: BoxConstraints(
//             maxHeight: 39,
//           ),
//           child: Container(
//             constraints: BoxConstraints(
//               minHeight: 29,
//               minWidth: 29,
//               maxHeight: 35,
//               maxWidth: 32,
//             ),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.pinkAccent[100]),
//           ),
//         ),
//         SizedBox(
//           width: 20,
//         ),
//         Container(
//           constraints: BoxConstraints(
//             maxHeight: 39,
//           ),
//           child: Container(
//             constraints: BoxConstraints(
//               minHeight: 29,
//               minWidth: 29,
//               maxHeight: 35,
//               maxWidth: 32,
//             ),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.blueGrey[700]),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';

class SelectColor extends StatefulWidget {
  const SelectColor({Key? key});

  @override
  _SelectColorState createState() => _SelectColorState();
}

class _SelectColorState extends State<SelectColor> {
  int selectedColorIndex = -1;

  final List<Color> colors = [
    Colors.red,
    const Color.fromARGB(255, 122, 152, 202),
    Colors.pinkAccent[100]!,
    Colors.blueGrey[700]!,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(colors.length, (index) {
        final color = colors[index];
        final isSelected = selectedColorIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedColorIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 30),
            child: Container(
              constraints: const BoxConstraints(
                minHeight: 29,
                minWidth: 29,
                maxHeight: 35,
                maxWidth: 32,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: color,
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                  : null,
            ),
          ),
        );
      }),
    );
  }
}
