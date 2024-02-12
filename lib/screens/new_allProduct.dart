import 'package:flutter/material.dart';
import 'package:shopping_app/screens/new_home.dart';

class NewAllProduct extends StatefulWidget {
  const NewAllProduct({super.key});

  @override
  State<NewAllProduct> createState() => _NewAllProductState();
}

class _NewAllProductState extends State<NewAllProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                SizedBox(
                  width: 10,
                ),
                const Text("Popular Products",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              items: [
                'Name',
                'Higher Price',
                'Lower Price',
                'Sale',
                'Newest',
                'Popularity'
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.sort), border: OutlineInputBorder()),
              onChanged: (value) {},
            ),
            SizedBox(
              height: 20,
            ),
            // All product view

            GridviewProduct()
          ]),
        ),
      ),
    );
  }
}
