import 'package:auto_route/auto_route.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/product_entity.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  final double? cardHeightFactor;
  final EdgeInsets? padding;
  final double? borderRadius;
  final VoidCallback? onCardTap;
  final VoidCallback? onSellerTap;
  final Widget? sellerIcon;
  final TextStyle? titleStyle;
  final TextStyle? priceStyle;
  final TextStyle? locationStyle;
  final bool showSellerAvatar; // New parameter to toggle avatar visibility

  const ProductCardWidget({
    required this.product,
    this.cardHeightFactor = 0.15,
    this.padding = const EdgeInsets.all(1.0),
    this.borderRadius = 15.0,
    this.onCardTap,
    this.onSellerTap,
    this.sellerIcon,
    this.titleStyle,
    this.priceStyle,
    this.locationStyle,
    this.showSellerAvatar = true, // Default to true for backward compatibility
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 15.0),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageSection(context),
          _buildInfoSection(context),
        ],
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap ??
          () => context.router.push(
                ProductDetailRoute(id: product.id.toString()),
              ),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * (cardHeightFactor ?? 0.15),
        width: double.infinity,
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _buildErrorImage(),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
      title: Text(
        product.name,
        style: titleStyle ??
            Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ETB ${product.price}',
            style: priceStyle ?? Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            "bole,adama",
            style: locationStyle ??
                Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
          ),
        ],
      ),
      trailing: showSellerAvatar ? _buildSellerAvatar(context) : null,
    );
  }

  Widget _buildSellerAvatar(BuildContext context) {
    return GestureDetector(
      onTap: onSellerTap ?? () => context.router.push(SellerProfileRoute()),
      child: CircleAvatar(
        radius: 17,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: sellerIcon ??
            Icon(
              Icons.abc,
              size: 20,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
    );
  }

  Widget _buildErrorImage() {
    return Container(
      color: Colors.grey[300],
      child: const Center(
        child: Icon(
          Icons.image_not_supported,
          color: Colors.grey,
          size: 50,
        ),
      ),
    );
  }
}
