import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/tokens/tokens.dart';
import 'package:gcpro/features/marketplace/presentation/providers/marketplace_state_provider.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/badge_cart_icon.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/product_list_view_widget.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/search_container.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/show_search_delegate.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class MarketPlaceScreen extends ConsumerWidget {
  const MarketPlaceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(allProductsProvider);

    return Scaffold(
      body: Column(
        children: [
          const SearchBarWidget(),
          const CategoryFilterWidget(),
          Expanded(
            child: allProducts.when(
              data: (products) => ProductListViewWidget(
                products: products,
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

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.035, bottom: 10),
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
              hintText: 'Search products...',
              heightMultiplier: 0.047,
              widthMultiplier: 0.8,
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: BadgeCartIcon(
              cartCount: 4,
              iconColor: Theme.of(context).colorScheme.secondary,
              iconSize: 27,
              onPressed: () {
                context.router.push(MarketplaceCartRoute());
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Category Filter Widget
class CategoryFilterWidget extends StatelessWidget {
  const CategoryFilterWidget({super.key});

  static const List<String> categories = [
    'Explore',
    'Pain Relief',
    'Vitamins',
    'Cold & Flu',
    'First Aid',
    'Prescriptions',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.033,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Text(
              categories[index],
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: kColorBlack50),
            ),
          );
        },
      ),
    );
  }
}

// Error Widget with Retry
class ErrorWidgetWithRetry extends StatelessWidget {
  final Object error;
  final WidgetRef ref;

  const ErrorWidgetWithRetry(
      {super.key, required this.error, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Something went wrong: $error'),
          ElevatedButton(
            onPressed: () => ref.refresh(allProductsProvider),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
