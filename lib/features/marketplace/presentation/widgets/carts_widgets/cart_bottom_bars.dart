import 'package:gcpro/features/marketplace/presentation/providers/marketplace_cart_provider.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/custom_button.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartBottomBar extends ConsumerWidget {
  final bool isAllSelected;
  final VoidCallback onAllSelectedChanged;
  final VoidCallback onCheckoutPressed;
  final int cartCount;
  final bool useCircularStyle;

  const CartBottomBar({
    super.key,
    required this.isAllSelected,
    required this.onAllSelectedChanged,
    required this.onCheckoutPressed,
    this.cartCount = 0,
    this.useCircularStyle = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(marketPlaceCartProvider);
    final cartNotifier = ref.read(marketPlaceCartProvider.notifier);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomCheckbox(
            value: isAllSelected,
            onChanged: onAllSelectedChanged,
            label: 'All',
            isCircular: useCircularStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "${cartNotifier.totalCartPrice.toStringAsFixed(1)} ETB",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.08,
              ),
              CustomButton(
                onPressed: onCheckoutPressed,
                label: 'Checkout (${cart.items.length})',
                minimumSize: Size(60, 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
