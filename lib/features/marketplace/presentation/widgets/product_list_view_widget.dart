import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../domain/entities/product_entity.dart';
import 'product_card_widget.dart';

// Stateless widget to display a list of products
class ProductListViewWidget extends StatelessWidget {
  // Required parameter: list of Product entities
  final List<Product> products;
  // Optional parameters with null safety
  final bool?
      showSellerAvater; // Note: 'Avater' seems to be a typo, should be 'Avatar'
  final bool physics;

  // Constructor with required and optional parameters
  const ProductListViewWidget(
      {required this.products,
      super.key,
      this.showSellerAvater,
      required this.physics // Note: physics is marked as required in constructor but optional in declaration
      });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // Conditional scroll physics based on physics parameter
      physics: physics
          ? AlwaysScrollableScrollPhysics()
          : NeverScrollableScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(20), // 20px padding on all sides
          sliver: SliverToBoxAdapter(
            child: StaggeredGrid.count(
              crossAxisCount: 2, // 2 columns in the grid
              mainAxisSpacing: 5, // Vertical spacing between items
              crossAxisSpacing: 5, // Horizontal spacing between items
              children: List.generate(products.length, (index) {
                return StaggeredGridTile.count(
                  crossAxisCellCount: 1, // Each tile spans 1 column
                  mainAxisCellCount:
                      index.isEven ? 1.3 : 1.1, // Alternating heights
                  child: ProductCardWidget(
                    product: products[index],
                    showSellerAvatar:
                        showSellerAvater ?? true, // Default to true if null
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
