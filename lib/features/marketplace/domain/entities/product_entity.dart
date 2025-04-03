class Product {
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.rating,
    required this.imageUrl,
  });
  final int id;
  final String name;
  final double price;
  final String description;
  final double rating;
  final String imageUrl;
}
