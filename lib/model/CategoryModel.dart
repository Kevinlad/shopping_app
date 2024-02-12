class CategoryModel {
  String name;
  String image;
  String category;
  CategoryModel(
      {required this.name, required this.image, required this.category});
}

var Categoryui = [
  CategoryModel(name: 'Man', image: 'young-man-1.png', category: 'category1'),
  CategoryModel(name: 'Women', image: 'woman-1.png', category: 'category2'),
  CategoryModel(name: 'Shop', image: 'shop-1.png', category: 'category3'),
  CategoryModel(
      name: 'Shopping', image: 'shopping-bag-1.png', category: 'category4'),
  CategoryModel(name: 'Gadgets', image: 'gadgets-1.png', category: 'category5'),
  CategoryModel(
      name: 'Furiture', image: 'furniture-1.png', category: 'category6'),
  CategoryModel(name: 'Gifts', image: 'presents-1.png', category: 'category7'),
  CategoryModel(name: 'See All', image: 'other-1.png', category: 'category8')
];
