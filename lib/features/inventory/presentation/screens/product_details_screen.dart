import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:gcpro/l10n/string_hardcoded.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Product {
  const Product({
    required this.productName,
    required this.productCode,
    required this.category,
    required this.brand,
    required this.description,
    required this.unit,
    required this.defaultPrice,
    required this.imageUrl,
  });

  @override
  String toString() {
    return 'Product(productName: $productName, productCode: $productCode, category: $category, brand: $brand, description: $description, unit: $unit, defaultPrice: $defaultPrice, imageUrl: $imageUrl)'
        .toLowerCase();
  }

  final String productName;
  final String productCode;
  final String category;
  final String brand;
  final String description;
  final String unit;
  final double defaultPrice;
  final String imageUrl;
}

@RoutePage()
class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    required this.product,
    super.key,
  });

  static const routeName = '/ProductDetailsScreen';

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          // Product Image with App Bar Overlay
          ProductImage(imageUrl: product.imageUrl),
          const Positioned(top: 0, left: 0, right: 0, child: CustomAppBar()),
          // Bottom Sheet Styled Details
          ProductDetailsContainer(
            productName: product.productName,
            productCode: product.productCode,
            category: product.category,
            brand: product.brand,
            unit: product.unit,
            defaultPrice: product.defaultPrice,
            description: product.description,
          ),
        ],
      ),
    );
  }
}

// 🔹 Top Image with App Bar Overlay
class ProductImage extends StatelessWidget {
  const ProductImage({required this.imageUrl, super.key});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(imageUrl, fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Theme.of(context).colorScheme.surface.withAlpha(170),
                  Colors.transparent,
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 🔹 Custom App Bar with Back Button
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kP20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black.withAlpha(110),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: kColorWhite,
                  size: 20,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.black.withAlpha(110),
              child: IconButton(
                // three dots icon
                icon: const Icon(
                  Icons.more_vert,
                  color: kColorWhite,
                  size: 20,
                ),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    useRootNavigator: true,
                    constraints: const BoxConstraints(maxHeight: 500),
                    builder: (context) {
                      return Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 15),
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, bottom: 16),
                              child: Text(
                                'Select Action'.hardcoded,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: kColorSchemeSeed,
                                    ),
                              ),
                            ),
                            Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: [
                                _buildOption(
                                  context,
                                  title: 'Edit'.hardcoded,
                                  icon: Icons.edit,
                                  onTap: () {
                                    AutoRouter.of(context)
                                        .push(EditProductRoute(productId: "1"));
                                  },
                                ),
                                _buildOption(
                                  context,
                                  title: 'Delete'.hardcoded,
                                  icon: Icons.delete,
                                  onTap: () {
                                    // AutoRouter.of(context)
                                    //     .push(const DeleteProductRoute());
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      dense: true,
      selectedTileColor: kColorSchemeSeed.withAlpha(15),
      visualDensity: const VisualDensity(
        vertical: VisualDensity.minimumDensity,
        horizontal: VisualDensity.minimumDensity,
      ),
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      onTap: onTap,
    );
  }
}

// 🔹 Bottom Sheet-Style Details
class ProductDetailsContainer extends StatelessWidget {
  const ProductDetailsContainer({
    required this.productName,
    required this.productCode,
    required this.category,
    required this.brand,
    required this.unit,
    required this.defaultPrice,
    required this.description,
    super.key,
  });

  final String productName;
  final String productCode;
  final String category;
  final String brand;
  final String unit;
  final double defaultPrice;
  final String description;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.5,
      maxChildSize: 0.7,
      snapAnimationDuration: const Duration(milliseconds: 500),
      builder: (context, scrollController) {
        return Container(
          padding: kPh20v15,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: kTopBorderRadius,
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: kPh4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 5,
                      width: 65,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const Gap(28),
                  Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(10),
                  ProductInfo(
                    productCode: productCode,
                    category: category,
                    brand: brand,
                    unit: unit,
                  ),
                  const Gap(20),
                  PriceTag(defaultPrice: defaultPrice),
                  const Gap(20),
                  ProductDescription(description: description),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// 🔹 Product Info Rows
class ProductInfo extends StatelessWidget {
  const ProductInfo({
    required this.productCode,
    required this.category,
    required this.brand,
    required this.unit,
    super.key,
  });
  final String productCode;
  final String category;
  final String brand;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailRow(
          title: AppLocalizations.of(context).product_code,
          value: productCode,
        ),
        DetailRow(
          title: AppLocalizations.of(context).category,
          value: category,
        ),
        DetailRow(title: AppLocalizations.of(context).brand, value: brand),
        DetailRow(title: AppLocalizations.of(context).unit, value: unit),
      ],
    );
  }
}

// 🔹 Reusable Detail Row
class DetailRow extends StatelessWidget {
  const DetailRow({required this.title, required this.value, super.key});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// 🔹 Price Tag
class PriceTag extends StatelessWidget {
  const PriceTag({required this.defaultPrice, super.key});
  final double defaultPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: kPh12v8,
      decoration: BoxDecoration(
        color: kColorSchemeSeed.withAlpha(40),
        borderRadius: kBorderRadius10,
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: AppLocalizations.of(context).etb,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: kColorSchemeSeed,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextSpan(
                text: defaultPrice.toStringAsFixed(2),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kColorSchemeSeed,
                    ),
              ),
              TextSpan(
                text: AppLocalizations.of(context).per_unit,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: kColorSchemeSeed,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 🔹 Product Description
class ProductDescription extends StatelessWidget {
  const ProductDescription({required this.description, super.key});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context).product_description,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const Gap(10),
        Text(
          description,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.grey[700]),
        ),
      ],
    );
  }
}
