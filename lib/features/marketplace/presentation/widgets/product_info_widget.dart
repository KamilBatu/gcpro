import 'package:gcpro_design_system/tokens/colors.dart';
import 'package:gcpro/features/marketplace/domain/entities/product_entity.dart';
import 'package:gcpro/features/marketplace/presentation/providers/marketplace_product_provider.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/product_image_widget.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/actionbutton_iconsbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/detial_product_provider.dart';

class ProductInfoWidget extends ConsumerWidget {
  final String name;
  final double price;
  final String description;
  final Product product;

  const ProductInfoWidget({
    super.key,
    required this.name,
    required this.price,
    required this.product,
    this.description = 'Detailed description goes here.',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.99,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        children: [
          const SizedBox(height: 5),
          _buildImageSectioon(context),
          _buildProductInfoSection(context),
          const SizedBox(height: 5),
          _buildKeyAttributesSection(context),
          const SizedBox(height: 5),
          _buildSimilarProductsSection(context, ref),
          const SizedBox(height: 5),
          _buildBuyersAlsoChoseSection(context, ref),
          const SizedBox(height: 5),
          _buildBestSellerSection(context, ref),
        ],
      ),
    );
  }

  Widget _buildImageSectioon(BuildContext context) {
    return Stack(
      children: [
        ProductImageWidget(
          imageUrl: product.imageUrl,
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Consumer(
            builder: (context, ref, child) {
              final favState = ref.watch(favoriteProvider);
              return IconButton(
                onPressed: () {
                  toggleFav(ref);
                },
                icon: CircleAvatar(
                  backgroundColor: kColorWhite,
                  radius: 17,
                  child: favState
                      ? const Icon(
                          Icons.favorite,
                          color: kColorSchemeSeed,
                          size: 22,
                        )
                      : const Icon(
                          Icons.favorite_border_outlined,
                          color: kColorBlack,
                          size: 22,
                        ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _buildProductInfoSection(BuildContext context) {
    return Container(
      color: kColorWhite,
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              name,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: Text(
              '${price.toString()} ETB ',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: Text(
              '★★★★★ 17 ratings',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyAttributesSection(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTitle(context, 'Key Attributes'),
              IconButton(
                onPressed: () {
                  // Add navigation or action for key attributes
                },
                icon: const Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1),
              2: FlexColumnWidth(3),
            },
            children: [
              TableRow(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: _buildLabel(context, 'Product Code'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: _buildValue(context, 'VITB12-100MG'),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: _buildLabel(context, 'Manufacturing Site'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: _buildValue(context, 'India'),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: _buildLabel(context, 'Pharmaceutical Brand'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: _buildValue(context, 'Zuoman pharma'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSimilarProductsSection(BuildContext context, WidgetRef ref) {
    final products = ref.watch(allProductsProvider);

    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTitle(context, 'See Similar Products'),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.15,
            child: products.when(
              data: (allProducts) => ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                itemCount: allProducts.length,
                itemBuilder: (context, index) {
                  final product = allProducts[index];
                  return Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        width: MediaQuery.sizeOf(context).width * 0.28,
                        height: MediaQuery.sizeOf(context).height * 0.12,
                        decoration: buildContainerDecoration(
                          backgroundColor: Colors.grey,
                          borderRadius: 10,
                        ),
                        child: Image.asset(
                          fit: BoxFit.cover,
                          product.imageUrl,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 10,
                        child: Text(
                          '${product.price} ETB',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 25,
                        left: 10,
                        child: IconButton(
                          onPressed: () {},
                          icon: buildCircleAvatar(
                              backgroundColor: kColorWhite50,
                              iconColor: kColorBlack,
                              icon: Icons.keyboard_arrow_right),
                        ),
                      )
                    ],
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text('Error: $error')),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildBuyersAlsoChoseSection(BuildContext context, WidgetRef ref) {
  final products = ref.watch(allProductsProvider);
  return Container(
    color: Theme.of(context).colorScheme.surface,
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTitle(context, 'Buyers Like You Also chose'),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.15,
          child: products.when(
            data: (allProducts) => ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              itemCount: allProducts.length,
              itemBuilder: (context, index) {
                final product = allProducts[2];
                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      width: MediaQuery.sizeOf(context).width * 0.28,
                      height: MediaQuery.sizeOf(context).height * 0.12,
                      decoration: buildContainerDecoration(
                        backgroundColor: Colors.grey,
                        borderRadius: 10,
                      ),
                      child: Image.asset(
                        fit: BoxFit.cover,
                        product.imageUrl,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      child: Text(
                        '${product.price} ETB',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 25,
                      left: 10,
                      child: IconButton(
                        onPressed: () {},
                        icon: buildCircleAvatar(
                            backgroundColor: kColorWhite50,
                            iconColor: kColorBlack,
                            icon: Icons.keyboard_arrow_right),
                      ),
                    )
                  ],
                );
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(child: Text('Error: $error')),
          ),
        ),
      ],
    ),
  );
}

Widget _buildBestSellerSection(BuildContext context, WidgetRef ref) {
  final products = ref.watch(allProductsProvider);
  return Container(
    color: Theme.of(context).colorScheme.surface,
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTitle(context, 'Best Sell From this Store'),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.15,
          child: products.when(
            data: (allProducts) => ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              itemCount: allProducts.length,
              itemBuilder: (context, index) {
                final product = allProducts[index % 2];
                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      width: MediaQuery.sizeOf(context).width * 0.28,
                      height: MediaQuery.sizeOf(context).height * 0.12,
                      decoration: buildContainerDecoration(
                        backgroundColor: Colors.grey,
                        borderRadius: 10,
                      ),
                      child: Image.asset(
                        fit: BoxFit.cover,
                        product.imageUrl,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      child: Text(
                        '${product.price} ETB',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 25,
                      left: 10,
                      child: IconButton(
                        onPressed: () {},
                        icon: buildCircleAvatar(
                            backgroundColor: kColorWhite50,
                            iconColor: kColorBlack,
                            icon: Icons.keyboard_arrow_right),
                      ),
                    )
                  ],
                );
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(child: Text('Error: $error')),
          ),
        ),
      ],
    ),
  );
}

Widget _buildTitle(BuildContext context, String title) {
  return Text(title,
      style: Theme.of(context).textTheme.displayMedium?.copyWith());
}

Widget _buildLabel(BuildContext context, String title) {
  return Text(title,
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(fontWeight: FontWeight.bold));
}

Widget _buildValue(BuildContext context, String title) {
  return Text(title,
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: kColorBlack50));
}
