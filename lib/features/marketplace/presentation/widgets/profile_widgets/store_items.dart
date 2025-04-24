import 'package:gcpro_design_system/tokens/tokens.dart';
import 'package:gcpro/features/marketplace/presentation/providers/marketplace_product_provider.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/product_list_view_widget.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/show_error.dart';
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20),
              child: Text(
                'Store Items ',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Icon(
                Icons.keyboard_arrow_right,
                size: 25,
                color: kColorBlack50,
              ),
            )
          ],
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
