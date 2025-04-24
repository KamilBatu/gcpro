import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro_design_system/widgets/loading_spinner.dart';

import 'package:gcpro/features/order/presentation/providers/state/cart_provider.dart';
import 'package:gcpro/features/order/presentation/widgets/animated_cart_increment.dart';
import 'package:gcpro/features/order/presentation/widgets/confirmation_bottomsheet.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class InventoryCartPage extends ConsumerWidget {
  InventoryCartPage({super.key});

  static const routeName = "/inventory-cart";
  final List<CartItem> items = [
    const CartItem(
      id: "1",
      name: "Item 1",
      price: 149,
      quantity: 1,
    ),
    const CartItem(
      id: "2",
      name: "Item 2",
      price: 187,
      quantity: 1,
    ),
    const CartItem(
      id: "3",
      name: "Item 3",
      price: 187,
      quantity: 1,
    ),
    const CartItem(
      id: "4",
      name: "Item 4",
      price: 187,
      quantity: 1,
    ),
    const CartItem(
      id: "5",
      name: "Item 5",
      price: 187,
      quantity: 1,
    ),
    const CartItem(
      id: "6",
      name: "Item 6",
      price: 187,
      quantity: 1,
    ),
    const CartItem(
      id: "7",
      name: "Item 7",
      price: 187,
      quantity: 1,
    ),
  ];

  Future<CartItem?> _showBottomSheet(BuildContext context) {
    return showModalBottomSheet<CartItem>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: kTopBorderRadius,
      ),
      showDragHandle: true,
      builder: (context) {
        return Padding(
          padding: kPh20v10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: kBorderRadius25,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: kBorderRadius25,
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: kBorderRadius25,
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding: kPh20v10,
                ),
                onChanged: (value) {},
              ),
              const Gap(10),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(120),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.image, color: Colors.black54),
                      ),
                      title: Text(items[index].name),
                      subtitle: Text(items[index].price.toString()),
                      onTap: () {
                        Navigator.pop(context, items[index]);
                      },
                    );
                  },
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.qr_code),
                title: Text(AppLocalizations.of(context).scan_qr_code),
                onTap: () {},
              ),
              const Gap(10),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final total = ref.read(cartProvider.notifier).getTotal();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).orders,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: kPh20v15,
        child: Column(
          children: [
            if (cart.isEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    AppLocalizations.of(context).no_orders_found,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final item = cart[index];
                    return Card(
                      elevation: 2,
                      margin: kPb15,
                      shape:
                          RoundedRectangleBorder(borderRadius: kBorderRadius10),
                      child: ListTile(
                        contentPadding: kPh20v10,
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha(120),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.image, color: Colors.black54),
                        ),
                        title: Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "${item.price} ${AppLocalizations.of(context).etb}",
                          style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha(150),
                          ),
                        ),
                        trailing: Container(
                          decoration: const BoxDecoration(
                            borderRadius: kBorderRadius8,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedIncrementButton(
                                icon: Icons.remove,
                                onLongPress: () {
                                  ref
                                      .read(cartProvider.notifier)
                                      .updateQuantity(index, 0);
                                },
                                onTap: () {
                                  ref
                                      .read(cartProvider.notifier)
                                      .updateQuantity(index, item.quantity - 1);
                                },
                              ),
                              SizedBox(
                                width: 38,
                                child: Text(
                                  item.quantity.toString(),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontFeatures: const [
                                      FontFeature.tabularFigures(),
                                      FontFeature.proportionalFigures(),
                                    ],
                                  ),
                                ),
                              ),
                              AnimatedIncrementButton(
                                icon: Icons.add,
                                onTap: () {
                                  ref
                                      .read(cartProvider.notifier)
                                      .updateQuantity(index, item.quantity + 1);
                                },
                                onLongPress: () {
                                  ref
                                      .read(cartProvider.notifier)
                                      .updateQuantity(index, item.quantity + 5);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            BFilledButton(
              isLoading: false,
              text: AppLocalizations.of(context).add_item,
              padding: 8,
              onPressed: () async {
                final newItem = await _showBottomSheet(context);
                if (newItem != null) {
                  ref.read(cartProvider.notifier).addItem(newItem);
                }
              },
            ),
            const Gap(32),
            Padding(
              padding: kPh20v10,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "$total ${AppLocalizations.of(context).etb}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: BFilledButton(
                      isLoading: false,
                      text: AppLocalizations.of(context).check_out,
                      padding: 0,
                      onPressed: () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Confirm Checkout'),
                            content: const Text(
                              'Are you sure you want to proceed to checkout?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text('Confirm'),
                              ),
                            ],
                          ),
                        );

                        if (confirm != null && confirm) {
                          () {
                            showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return const Center(child: LoadingSpinner());
                              },
                            );
                          }();
                          await Future.delayed(
                            const Duration(seconds: 3),
                            () {},
                          );
                          () {
                            Navigator.of(context).pop();
                            showConfirmationBottomSheet(context).then((value) {
                              Navigator.of(context).pop();
                            });
                          }();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
