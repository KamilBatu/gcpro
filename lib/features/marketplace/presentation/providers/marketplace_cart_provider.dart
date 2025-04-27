import 'package:gcpro/features/marketplace/domain/entities/cart_entity.dart';
import 'package:gcpro/features/marketplace/domain/entities/product_entity.dart';
import 'package:gcpro/features/marketplace/presentation/providers/text_controller_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<Cart> {
  CartNotifier()
      : super(
          Cart(
            items: [
              CartItem(
                id: 1,
                product: Product(
                  id: 1,
                  name: "PainRelief Plus",
                  price: 12.99,
                  description:
                      "Fast-acting pain reliever for headaches and muscle pain",
                  rating: 4.3,
                  imageUrl: "assets/images/placeholders/m4.jpg",
                  category: Category(id: 1),
                ),
                singleCartPrice: 120,
              ),
            ],
          ),
        );

  double get totalCartPrice => state.items.fold(0, (sum, item) {
        if (item.isSelected == true) {
          return sum + item.singleCartPrice;
        }
        return sum;
      });

  void addToCart(Product product, int quantity, {WidgetRef? ref}) {
    if (quantity <= 0 || quantity > 100) {
      return;
    }
    final existingItemIndex =
        state.items.indexWhere((item) => item.product.id == product.id);
    if (existingItemIndex != -1) {
      final updatedItems = List<CartItem>.from(state.items);
      final newQuantity = quantity;
      if (newQuantity > 100) {
        return;
      }
      updatedItems[existingItemIndex] = CartItem(
        id: product.id,
        product: product,
        singleCartPrice: product.price * newQuantity,
        quantity: newQuantity,
      );
      state = Cart(items: updatedItems);
    } else {
      final newItem = CartItem(
        id: product.id,
        product: product,
        singleCartPrice: product.price * quantity,
        quantity: quantity,
      );
      state = Cart(items: [...state.items, newItem]);
    }
    if (ref != null) {
      ref.read(textControllerProvider(product.id).notifier).state =
          quantity.toString();
    }
  }

  void addInCart(Product product, WidgetRef ref) {
    final existingItemIndex =
        state.items.indexWhere((item) => item.product.id == product.id);
    if (existingItemIndex == -1) {
      final newItem = CartItem(
        id: product.id,
        product: product,
        singleCartPrice: product.price,
        quantity: 1,
      );
      state = Cart(items: [...state.items, newItem]);
      ref.read(textControllerProvider(product.id).notifier).state = '1';
      return;
    }
    final currentQuantity = state.items[existingItemIndex].quantity;
    if (currentQuantity < 100) {
      final updatedItems = List<CartItem>.from(state.items);
      final newQuantity = currentQuantity + 1;
      updatedItems[existingItemIndex] = CartItem(
        id: product.id,
        product: product,
        singleCartPrice: product.price * newQuantity,
        quantity: newQuantity,
      );
      state = Cart(items: updatedItems);
      ref.read(textControllerProvider(product.id).notifier).state =
          newQuantity.toString();
    }
  }

  void updateQuantity(Product product, WidgetRef ref, String quantityValue) {
    final existingItemIndex =
        state.items.indexWhere((item) => item.product.id == product.id);
    int newQuantity = int.parse(quantityValue);
    if (newQuantity < 100) {
      final updatedItems = List<CartItem>.from(state.items);
      updatedItems[existingItemIndex] = CartItem(
        id: product.id,
        product: product,
        singleCartPrice: product.price * newQuantity,
        quantity: newQuantity,
      );
      state = Cart(items: updatedItems);
      ref.read(textControllerProvider(product.id).notifier).state =
          newQuantity.toString();
    }
  }

  void reduceInCart(Product product, WidgetRef ref) {
    final existingItemIndex =
        state.items.indexWhere((item) => item.product.id == product.id);
    if (existingItemIndex == -1) {
      return;
    }
    final updatedItems = List<CartItem>.from(state.items);
    final currentQuantity = state.items[existingItemIndex].quantity;
    if (currentQuantity > 1) {
      final newQuantity = currentQuantity - 1;
      updatedItems[existingItemIndex] = CartItem(
        id: product.id,
        product: product,
        singleCartPrice: product.price * newQuantity,
        quantity: newQuantity,
      );
      state = Cart(items: updatedItems);
      ref.read(textControllerProvider(product.id).notifier).state =
          newQuantity.toString();
    } else {
      updatedItems.removeAt(existingItemIndex);
      state = Cart(items: updatedItems);
      ref.read(textControllerProvider(product.id).notifier).state = '0';
    }
  }

  void setQuantityText(Product product, WidgetRef ref, {int? quantity}) {
    final currentText =
        ref.read(textControllerProvider(product.id).notifier).state;
    int currentQuantity = int.tryParse(currentText) ?? 0;
    if (quantity != null) {
      if (quantity <= 0 || quantity > 100) {
        return;
      }
      ref.read(textControllerProvider(product.id).notifier).state =
          quantity.toString();
    } else {
      if (currentQuantity < 100) {
        ref.read(textControllerProvider(product.id).notifier).state =
            (currentQuantity + 1).toString();
      }
    }
  }

  void reduceQuantityText(Product product, WidgetRef ref) {
    final currentText =
        ref.read(textControllerProvider(product.id).notifier).state;
    int currentQuantity = int.tryParse(currentText) ?? 0;
    if (currentQuantity > 0) {
      ref.read(textControllerProvider(product.id).notifier).state =
          (currentQuantity - 1).toString();
    }
  }

  void clearCart() {
    state = Cart(items: []);
  }

  void toggleItemSelection(int productId) {
    final updatedItems = state.items.map((item) {
      if (item.product.id == productId) {
        return item.copyWith(isSelected: !item.isSelected);
      }
      return item;
    }).toList();
    state = Cart(items: updatedItems);
  }

  void setAllSelected(bool isSelected) {
    if (isSelected == true) {
      final updatedItems = state.items.map((item) {
        return item.copyWith(isSelected: true);
      }).toList();
      state = Cart(items: updatedItems);
    } else {
      final updatedItems = state.items.map((item) {
        return item.copyWith(isSelected: isSelected);
      }).toList();
      state = Cart(items: updatedItems);
    }
  }
}

final marketPlaceCartProvider =
    StateNotifierProvider<CartNotifier, Cart>((ref) => CartNotifier());
