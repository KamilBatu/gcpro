import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/quantity_selecter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/product_entity.dart';
import '../providers/action_state_provider.dart';

void showBottomSheetAddToCart(BuildContext context, Product product) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allows the bottom sheet to take custom height
    builder: (BuildContext context) {
      return Container(
        height:
            MediaQuery.of(context).size.height * 0.75, // 90% of screen height
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColumnWidget(product: product),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  // Add your button action here
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(
                      double.infinity, 50), // Makes button full width
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 0.2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

void showBottomSheetBuyNow(BuildContext context, Product product) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allows the bottom sheet to take custom height
    builder: (BuildContext context) {
      return Container(
        height:
            MediaQuery.of(context).size.height * 0.75, // 90% of screen height
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColumnWidget(product: product),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  // Add your button action here
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(
                      double.infinity, 50), // Makes button full width
                  backgroundColor:
                      Theme.of(context).colorScheme.primary, // Fill color
                  foregroundColor: Theme.of(context)
                      .colorScheme
                      .onPrimary, // Text/icon color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  // Optional: If you still want a subtle border
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 0.2,
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary, // Text color for filled button
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

class ColumnWidget extends StatelessWidget {
  final Product product;
  const ColumnWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(product.imageUrl),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.035,
        ),
        ListTile(
          title: Text(
            'ETB ${product.price.toString()}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: Text(
            product.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        ListTile(
          leading: Text(
            'Quantity',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: Container(
            width: MediaQuery.sizeOf(context).width * 0.4,
            child: Consumer(
              builder: (context, ref, child) {
                return QuantitySelector(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  height: MediaQuery.sizeOf(context).height * 0.05,
                  ref: ref,
                  onAdd: () => addQuantity(ref),
                  onRemove: () => removeQuantity(ref),
                  controller: ref.watch(textControllerProvider),
                  numberProvider: numberProvider,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
