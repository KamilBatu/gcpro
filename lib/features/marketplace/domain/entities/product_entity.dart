class Category {
  final int? id;
  final String? name;
  final bool? isSelected;
  Category({this.id, this.name, this.isSelected = false});
}

class Product {
  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.rating,
      required this.imageUrl,
      required this.category});
  final int id;
  final String name;
  final double price;
  final String description;
  final double rating;
  final String imageUrl;
  final Category category;
}
