import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/actionbutton_iconsbutton.dart';
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
      decoration: buildContainerDecoration(
          borderRadius: 8,
          offsetY: -1,
          blurRadius: 1,
          boxColor: Colors.transparent),
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
          () => context.router.push(RelatedProductPage(id: product.id)),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * (cardHeightFactor ?? 0.15),
        width: double.infinity,
        child: Image.asset(
          product.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _buildErrorImage(),
          // loadingBuilder: (context, child, loadingProgress) {
          //   if (loadingProgress == null) return child;
          //   return Center(child: CircularProgressIndicator());
          // },
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
            Theme.of(context).textTheme.bodySmall?.copyWith(
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
                      color: kColorSchemeSeed,
                    ),
          ),
        ],
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
