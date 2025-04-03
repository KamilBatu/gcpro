// import 'package:auto_route/auto_route.dart';
import 'package:gcpro/features/inventory/presentation/providers/state/product_list_provider.dart';
import 'package:gcpro/features/inventory/presentation/screens/product_details_screen.dart';
import 'package:gcpro/features/inventory/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductSearchDelegate extends SearchDelegate<Product?> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final productList = ref.watch(productListProvider(query));
        return productList.when(
          data: (products) {
            if (products.isEmpty) {
              return const Center(child: Text('No products found.'));
            }
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductItem(
                  icon: Icons.eco,
                  name: product.productName,
                  stock: "100",
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
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
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final productList = ref.watch(productListProvider(query));
        return productList.when(
          data: (products) {
            if (products.isEmpty) {
              return const Center(child: Text('No suggestions available.'));
            }
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductItem(
                  icon: Icons.eco,
                  name: product.productName,
                  stock: "100",
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
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
        );
      },
    );
  }
}
