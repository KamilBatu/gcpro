import 'package:gcpro/features/marketplace/presentation/providers/colors_provider.dart';
import 'package:gcpro/features/marketplace/presentation/providers/marketplace_category_provider.dart';
import 'package:gcpro/features/marketplace/presentation/providers/marketplace_product_provider.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/product_list_view_widget.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/actionbutton_iconsbutton.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/search_container.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/show_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MarketplaceWholesale extends ConsumerWidget {
  const MarketplaceWholesale({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(allProductsProvider);
    final selectedProducts = ref.watch(ListOfselectedCategoryProvider);
    final selectedCategory = ref.watch(categoriesProvider);

    return Scaffold(
      body: Column(
        children: [
          const SearchBarWidget(),
          Expanded(
            child: allProducts.when(
              data: (products) => ProductListViewWidget(
                products:
                    selectedCategory.isNotEmpty ? selectedProducts : products,
                physics: true,
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => ErrorWidgetWithRetry(error: error, ref: ref),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorProvide = ref.watch(colorsProvider);
    return Container(
      color: colorProvide.backgroundColor,
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            child: SearchContainer(
              backgroundColor: colorProvide.searchFieldColor,
              hintTextColor: colorProvide.hintColor,
              borderColor: colorProvide.borderLineColor,
              iconColor: colorProvide.searchIconColor,
              hintText: 'Search products...',
              heightMultiplier: 0.05,
              widthMultiplier: 0.9,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
