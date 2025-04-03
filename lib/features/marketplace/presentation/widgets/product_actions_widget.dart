import 'package:auto_route/auto_route.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'show_bottom_sheet_action.dart';
import '../../domain/entities/product_entity.dart';

class ProductActionsWidget extends StatefulWidget {
  const ProductActionsWidget({super.key, required this.product});
  final Product product;

  @override
  State<ProductActionsWidget> createState() => _ProductActionsWidgetState();
}

class _ProductActionsWidgetState extends State<ProductActionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.chat_bubble_outline),
            ),
            IconButton(
              onPressed: () {
                context.router.push(MarketplaceCartRoute());
              },
              icon: Icon(Icons.shopping_cart_outlined),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                showBottomSheetAddToCart(context, widget.product);
              },
              child: const Text('Add to Cart'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(60, 40), // Button's visible size
                backgroundColor:
                    Colors.transparent, // Transparent fill for outline
                foregroundColor:
                    Theme.of(context).colorScheme.secondary, // Text color
                side: BorderSide(
                  color:
                      Theme.of(context).colorScheme.secondary, // Border color
                  width: 0.5, // Border thickness
                ),
                elevation: 0, // No shadow
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () {
                showBottomSheetBuyNow(context, widget.product);
              },
              child: Text('Buy now',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  )),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(60, 40),
                  backgroundColor: Theme.of(context).colorScheme.primary),
            )
          ],
        ),
      ],
    );
  }
}
