import 'package:gcpro_design_system/tokens/colors.dart';
import 'package:gcpro_design_system/widgets/loading_spinner.dart';
import 'package:gcpro/features/marketplace/domain/entities/product_entity.dart';
import 'package:gcpro/features/marketplace/presentation/providers/marketplace_cart_provider.dart';
import 'package:gcpro/features/marketplace/presentation/providers/text_controller_provider.dart';
import 'package:gcpro/features/marketplace/presentation/providers/toggle_provider.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/quantity_selecter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void showBottomSheets({
  required BuildContext context,
  required Product product,
  required bool isBuyNow,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Consumer(
        builder: (context, ref, child) {
          // Watch the controller for the product's quantity
          final text = ref.watch(textControllerProvider(product.id));

          return Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ColumnWidget(product: product),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      final quantity = int.tryParse(text) ?? 1;
                      ref
                          .read(marketPlaceCartProvider.notifier)
                          .addToCart(product, quantity, ref: ref);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: isBuyNow
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.primary,
                      foregroundColor: isBuyNow
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 0.2,
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        color: isBuyNow
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
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
        Image.network(
          product.imageUrl,
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.3,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.035),
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
                final value = ref.watch(textControllerProvider(product.id));
                return QuantitySelector(
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  height: MediaQuery.sizeOf(context).height * 0.035,
                  quantity: int.parse(value),
                  onAdd: () => ref
                      .read(marketPlaceCartProvider.notifier)
                      .setQuantityText(product, ref),
                  onRemove: () => ref
                      .read(marketPlaceCartProvider.notifier)
                      .reduceQuantityText(product, ref),
                  onQuantityChanged: (newQuantity) {
                    ref
                        .read(marketPlaceCartProvider.notifier)
                        .updateQuantity(product, ref, newQuantity.toString());
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
