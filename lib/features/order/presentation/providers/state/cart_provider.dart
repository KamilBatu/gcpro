import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class Cart extends _$Cart {
  @override
  List<CartItem> build() => [
        const CartItem(id: "1", name: "Item 1", price: 149, quantity: 2),
        const CartItem(id: "2", name: "Item 2", price: 187, quantity: 2),
      ];

  void addItem(CartItem item) {
    if (state.any((element) => element.id == item.id)) {
      state = [
        for (int i = 0; i < state.length; i++)
          if (state[i].id == item.id)
            state[i].copyWith(quantity: state[i].quantity + item.quantity)
          else
            state[i],
      ];
    } else {
      state = [...state, item];
    }
  }

  void updateQuantity(int index, int newQuantity) {
    if (newQuantity >= 0) {
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == index)
            state[i].copyWith(quantity: newQuantity)
          else
            state[i],
      ];
      state = state.where((element) => element.quantity != 0).toList();
    }
  }

  double getTotal() {
    return state.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}

@immutable
class CartItem {
  const CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });
  final String id;
  final String name;
  final double price;
  final int quantity;

  CartItem copyWith({String? name, double? price, int? quantity}) {
    return CartItem(
      id: id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CartItem &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ price.hashCode;
}
