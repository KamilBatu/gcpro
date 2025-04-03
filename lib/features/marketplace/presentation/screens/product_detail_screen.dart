import 'package:auto_route/auto_route.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/product_actions_widget.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/product_detail_app_bar.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/product_image_widget.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/product_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gcpro/features/marketplace/presentation/providers/marketplace_state_provider.dart';

@RoutePage()
class ProductDetailScreen extends ConsumerWidget {
  final String id;

  const ProductDetailScreen(this.id);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productByIdProvider(int.parse(id)));

    return Scaffold(
      appBar: ProductDetailAppBar(
        productAsync: productAsync,
      ),
      body: productAsync.when(
        data: (product) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImageWidget(imageUrl: product.imageUrl),
                const SizedBox(height: 16),
                ProductInfoWidget(
                  name: product.name,
                  price: product.price,
                  description:
                      'Detailed description for ${product.name} goes here.',
                ),
              ],
            ),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      bottomNavigationBar: productAsync.when(
        data: (product) => ProductActionsWidget(product: product),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
