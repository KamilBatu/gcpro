import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/custom_button.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';

// Main Cart Bottom Bar Widget
class CartBottomBar extends StatelessWidget {
  final bool isAllSelected;
  final VoidCallback onAllSelectedChanged;
  final VoidCallback onCheckoutPressed;
  final String totalAmount;
  final int cartCount;
  final bool useCircularStyle;

  const CartBottomBar({
    super.key,
    required this.isAllSelected,
    required this.onAllSelectedChanged,
    required this.onCheckoutPressed,
    required this.totalAmount,
    this.cartCount = 0,
    this.useCircularStyle = true,
  });

  @override
  Widget build(BuildContext context) {
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
                "ETB${totalAmount} >",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.08,
              ),
              CustomButton(
                onPressed: onCheckoutPressed,
                label: 'Checkout ($cartCount)',
                minimumSize: Size(60, 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
