import 'package:gcpro/features/marketplace/domain/entities/product_entity.dart';

class CartItem {
  final int id;
  final Product product;
  final double singleCartPrice;
  final int quantity;
  final bool isSelected;

  CartItem({
    required this.id,
    required this.product,
    required this.singleCartPrice,
    this.quantity = 1,
    this.isSelected = true,
  });

  // Optional: For immutability, provide a copyWith method
  CartItem copyWith(
      {int? id,
      String? name,
      double? price,
      int? quantity,
      required bool isSelected}) {
    return CartItem(
      id: id ?? this.id,
      product: product,
      singleCartPrice: price ?? this.singleCartPrice,
      quantity: quantity ?? this.quantity,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class Cart {
  final List<CartItem> items;
  Cart({required this.items});
}
