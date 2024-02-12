class Product_Model {
  final String image;
  final String name;
  final int price;
  final String title;
  Product_Model(
      {required this.image,
      required this.name,
      required this.price,
      required this.title});
}

var productui=[
  Product_Model(image:'assets/images/Item_1_2xx.png', name:  "Blue Nike Shoes", price: 35, title: "Nike"),
    Product_Model(image:'assets/images/Item_2_2x.png', name:  "Yellow Nike Shoes", price: 36, title: "adid")
];