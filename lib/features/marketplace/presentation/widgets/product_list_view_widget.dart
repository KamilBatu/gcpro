import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/features/marketplace/presentation/providers/colors_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../domain/entities/product_entity.dart';
import 'product_card_widget.dart';

class ProductListViewWidget extends ConsumerStatefulWidget {
  final List<Product> products;
  final bool? showSellerAvater;
  final bool physics;

  const ProductListViewWidget(
      {required this.products,
      super.key,
      this.showSellerAvater,
      required this.physics});

  @override
  ConsumerState<ProductListViewWidget> createState() =>
      _ProductListViewWidgetState();
}

class _ProductListViewWidgetState extends ConsumerState<ProductListViewWidget> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    print('ScrollController initialized');
    scrollController.addListener(listenToScrollMoment);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void listenToScrollMoment() {
    if (scrollController.offset > scrollController.position.minScrollExtent) {
      ref.read(colorsProvider.notifier).changeColors(
          foregroundColor: kColorSchemeSeed,
          backgroundColor: kColorWhite,
          linkColor: kColorSchemeSeed,
          textColor: kColorBlack,
          cartColor: kColorBlack,
          hintColor: kColorBlack50,
          searchFieldColor: kColorWhite50,
          borderLineColor: kColorBlack,
          searchIconColor: kColorBlack,
          whiteblack: kColorBlack);
    } else {
      ref.read(colorsProvider.notifier).resetColors();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      physics: widget.physics
          ? AlwaysScrollableScrollPhysics()
          : NeverScrollableScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverToBoxAdapter(
            child: StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              children: List.generate(widget.products.length, (index) {
                return StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: index.isEven ? 1.3 : 1.1,
                  child: ProductCardWidget(
                    product: widget.products[index],
                    showSellerAvatar: widget.showSellerAvater ?? true,
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
