import 'package:gcpro/features/marketplace/presentation/providers/marketplace_state_provider.dart';
import 'package:gcpro/features/marketplace/presentation/screens/marketplace_screen.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/product_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoreItems extends ConsumerWidget {
  const StoreItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(allProductsProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 5),
          child: Text(
            'Store Items',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Expanded(
          child: allProducts.when(
            data: (products) => ProductListViewWidget(
              products: products,
              showSellerAvater: false,
              physics: true,
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => ErrorWidgetWithRetry(error: error, ref: ref),
          ),
        ),
      ],
    );
  }
}

class StoreList extends StatelessWidget {
  const StoreList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
