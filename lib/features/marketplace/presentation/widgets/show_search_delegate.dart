import 'package:gcpro/features/marketplace/presentation/providers/marketplace_product_provider.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final productList = ref.watch(allProductsProvider);
        return productList.when(
          data: (products) {
            // Filter products based on query
            final filteredProducts = products
                .where((product) =>
                    product.name.toLowerCase().contains(query.toLowerCase()))
                .toList();

            if (filteredProducts.isEmpty) {
              return const Center(
                child: Text('No product found'),
              );
            }
            return CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverToBoxAdapter(
                    child: StaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      children: List.generate(filteredProducts.length, (index) {
                        return StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: index.isEven ? 1.3 : 1.1,
                          child: ProductCardWidget(
                              product: filteredProducts[index]),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            );
          },
          error: (error, stack) => Center(
            child: SelectableText.rich(
              TextSpan(
                text: 'Error: ',
                style: const TextStyle(color: Colors.red),
                children: [
                  TextSpan(
                    text: error.toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final productList = ref.watch(allProductsProvider);
        return productList.when(
          data: (products) {
            // Filter products based on query
            final filteredProducts = products.where(
              (element) {
                return element.name.toLowerCase().contains(query.toLowerCase());
              },
            ).toList();

            if (filteredProducts.isEmpty) {
              return const Center(
                child: Text('No product found'),
              );
            }
            return ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final searchedProduct = filteredProducts[index];
                return ListTile(
                  leading: Icon(Icons.search),
                  title: GestureDetector(
                    child: Text(
                      searchedProduct.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onTap: () {
                      query = searchedProduct.name;
                      showResults(context);
                    },
                  ),
                );
              },
            );
          },
          error: (error, stack) => Center(
            child: SelectableText.rich(
              TextSpan(
                text: 'Error: ',
                style: const TextStyle(color: Colors.red),
                children: [
                  TextSpan(
                    text: error.toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
