import 'package:flutter/material.dart';

class BadgeCartIcon extends StatelessWidget {
  final int cartCount;
  final VoidCallback? onPressed;
  final Color iconColor;
  final double iconSize;
  final Color badgeColor;
  final double badgeSize;
  final Color badgeTextColor;
  final double badgeTextSize;
  final FontWeight badgeTextWeight;

  const BadgeCartIcon({
    super.key,
    required this.cartCount,
    this.onPressed,
    this.iconColor = Colors.black,
    this.iconSize = 24,
    this.badgeColor = Colors.red,
    this.badgeSize = 20,
    this.badgeTextColor = Colors.white,
    this.badgeTextSize = 12,
    this.badgeTextWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildCartIcon(),
        if (cartCount > 0) _buildBadge(),
      ],
    );
  }

  Widget _buildCartIcon() {
    return IconButton(
      icon: Icon(
        Icons.shopping_cart_outlined,
        color: iconColor,
        size: iconSize,
      ),
      onPressed: onPressed,
    );
  }

  Widget _buildBadge() {
    return Positioned(
      right: 3,
      top: 3,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: badgeColor,
          shape: BoxShape.circle,
        ),
        constraints: BoxConstraints(
          minWidth: badgeSize,
          minHeight: badgeSize,
        ),
        child: Text(
          '$cartCount',
          style: TextStyle(
            color: badgeTextColor,
            fontSize: badgeTextSize,
            fontWeight: badgeTextWeight,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
