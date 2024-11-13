import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/whishlist_provider.dart';

class Whishlist extends StatefulWidget {
  const Whishlist({super.key});

  @override
  State<Whishlist> createState() => _WhishlistState();
}

class _WhishlistState extends State<Whishlist> {
  @override
  Widget build(BuildContext context) {
    var wishlistProvider = Provider.of<WishlistProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text("WhishList"),
      ),
      body: wishlistProvider.wishlist.isEmpty
          ? Center(
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
          : ListView.builder(
              itemCount: wishlistProvider.wishlist.length,
              itemBuilder: (_, index) {
                var product = wishlistProvider.wishlist[index];
                return ListTile(
                  leading: Image.asset(product.image),
                  title: Text(product.name),
                  subtitle: Text("\$${product.price}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () {
                      wishlistProvider.removeFromWishlist(product);
                    },
                  ),
                );
              }),
    );
  }
}
