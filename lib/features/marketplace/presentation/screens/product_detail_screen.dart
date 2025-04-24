import 'package:auto_route/auto_route.dart';
import 'package:gcpro/features/marketplace/presentation/providers/marketplace_product_provider.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/product_actions_widget.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/product_detail_app_bar.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/product_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ProductDetailScreen extends ConsumerWidget {
  final int id;

  const ProductDetailScreen(this.id);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productByIdProvider(id));

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: ProductDetailAppBar(productAsync: productAsync),
      body: productAsync.when(
        data: (product) => ProductInfoWidget(
          product: product,
          name: product.name,
          price: product.price,
          description: 'Detailed description for ${product.name} goes here.',
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
