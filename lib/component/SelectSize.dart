import 'package:flutter/material.dart';

class SelectSize extends StatefulWidget {
  SelectSize({
    super.key,
  });

  @override
  State<SelectSize> createState() => _SelectSizeState();
}

class _SelectSizeState extends State<SelectSize> {
  int selectedSizeIndex = -1; // Initialize with no selection

  // Sizes available for selection
  final List<String> sizes = ["S", "M", "L", "XL"];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(sizes.length, (index) {
        final size = sizes[index];
        return Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedSizeIndex = index; // Update selected index
              });
            },
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 39,
              ),
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 29,
                  minWidth: 29,
                  maxHeight: 35,
                  maxWidth: 32,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: selectedSizeIndex == index
                      ? Colors.blue
                      : Colors.grey[300],
                ),
                child: Center(
                  child: Text(
                    size,
                    style: TextStyle(
                      fontSize: 20,
                      color: selectedSizeIndex == index
                          ? Colors.white
                          : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
