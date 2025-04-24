import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/tokens/tokens.dart';
import 'package:gcpro_design_system/widgets/loading_spinner.dart';
import 'package:gcpro/features/marketplace/presentation/providers/marketplace_cart_provider.dart';
import 'package:gcpro/features/marketplace/presentation/providers/toggle_provider.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/carts_widgets/cart_bottom_bars.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/carts_widgets/cart_checkbox_widget.dart';
import 'package:gcpro/features/order/presentation/widgets/confirmation_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class MarketplaceCartScreen extends ConsumerWidget {
  const MarketplaceCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProvid = ref.watch(marketPlaceCartProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.titleLarge),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('remove all cart'),
                  content: Container(
                    width: 200,
                    height: 30,
                    color: kColorWhite25,
                    child: Text(
                      'do you want to remove all cart?',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('cancel')),
                    TextButton(
                        onPressed: () {
                          ref
                              .read(marketPlaceCartProvider.notifier)
                              .clearCart();
                          Navigator.pop(context);
                        },
                        child: const Text('yes')),
                  ],
                  actionsPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
              );
            },
            icon: Icon(
              Icons.delete_outline,
              size: 24,
              color: kColorDarkDanger,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: cartProvid.items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 0.3,
            ),
            child: CartCheckboxWidget(
              title: cartProvid.items[index].product.name,
              subtitle: "expiring in 4 year",
              price: cartProvid.items[index].singleCartPrice.toStringAsFixed(1),
              quantity: cartProvid.items[index].quantity,
              product: cartProvid.items[index].product,
            ),
          );
        },
      ),
      bottomNavigationBar: CartBottomBar(
        isAllSelected: ref.watch(isAllSelectedProvider),
        onAllSelectedChanged: () {
          ref.read(isAllSelectedProvider.notifier).toggle(ref);
          ref
              .read(marketPlaceCartProvider.notifier)
              .setAllSelected(ref.watch(isAllSelectedProvider));
        },
        onCheckoutPressed: () async {
          showDialog(
            context: context,
            builder: (context) => LoadingSpinner(),
          );
          await Future.delayed(Duration(seconds: 1));
          showConfirmationBottomSheet(context);
        },
        cartCount: 2,
      ),
    );
  }
}
