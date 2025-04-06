import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_sysytem.dart';
import 'package:gcpro/features/inventory/presentation/providers/state/recieve_inventory_state_provider.dart';
import 'package:gcpro/features/inventory/presentation/widgets/bottomsheet_dropdown.dart';
import 'package:gcpro/shared/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class RecieveInventoryScreen extends ConsumerWidget {
  RecieveInventoryScreen({super.key, this.defaultProduct});
  static const routeName = '/RecieveInventoryScreen';

  final DropdownItem? defaultProduct;
  final TextEditingController _sellingPriceController = TextEditingController();
  final TextEditingController _revenueController = TextEditingController();
  final TextEditingController _stockQuantityController =
      TextEditingController();
  final TextEditingController _purchasePriceController =
      TextEditingController();
  final TextEditingController _batchNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _supplierController = TextEditingController();
  final TextEditingController _productController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final revenuePercentage = ref.watch(revenuePercentageProvider);
    _revenueController.text = revenuePercentage.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Receive Inventory'),
        backgroundColor: kColorSchemeSeed,
      ),
      body: Padding(
        padding: kP16,
        child: SingleChildScrollView(
          padding: kP8,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(16),
              BottomSheetDropdown(
                initialItems: [
                  DropdownItem(
                    title: "Item 1",
                    subtitle: "Description 1",
                    imageUrl: "https://placehold.co/600x400/png",
                  ),
                  DropdownItem(
                    title: "Item 2",
                    subtitle: "Description 2",
                    imageUrl: "https://placehold.co/600x400/png",
                  ),
                  DropdownItem(
                    title: "Item 3",
                    subtitle: "Description 3",
                    imageUrl: "https://placehold.co/600x400/png",
                  ),
                  DropdownItem(
                    title: "Item 4",
                    subtitle: "Description 4",
                    imageUrl: "https://placehold.co/600x400/png",
                  ),
                  DropdownItem(
                    title: "Item 5",
                    subtitle: "Description 5",
                    imageUrl: "https://placehold.co/600x400/png",
                  ),
                  DropdownItem(
                    title: "Item 6",
                    subtitle: "Description 6",
                    imageUrl: "https://placehold.co/600x400/png",
                  ),
                  DropdownItem(
                    title: "Item 7",
                    subtitle: "Description 7",
                    imageUrl: "https://placehold.co/600x400/png",
                  ),
                ],
                hintText: "Product",
                title: "Product",
                defaultItem: defaultProduct,
                onItemSelected: (item) {
                  _productController.text = item.title;
                },
              ),
              const Gap(24),
              CustomTextField(
                lableText: 'Batch Number',
                hintText: 'BASD-123456',
                controller: _batchNumberController,
                suffixIcon: const Icon(
                  Icons.batch_prediction_rounded,
                  size: kIconSizeSmall,
                ),
                obscureText: false,
              ),
              const Gap(24),
              CustomTextField(
                lableText: 'Expiry Date',
                hintText: '2025-01-01',
                date: true,
                controller: _expiryDateController,
                suffixIcon: const Icon(
                  Icons.calendar_month_rounded,
                  size: kIconSizeSmall,
                ),
                obscureText: false,
              ),
              const Gap(24),
              CustomTextField(
                lableText: 'Purchase Price',
                hintText: '100 ETB',
                number: true,
                controller: _purchasePriceController,
                suffixIcon: const Icon(
                  Icons.currency_exchange_rounded,
                  size: kIconSizeSmall,
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _sellingPriceController.text =
                        (double.parse(value) * (revenuePercentage / 100))
                            .toStringAsFixed(2);
                  }
                },
                obscureText: false,
              ),
              const Gap(24),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextField(
                      lableText: 'Selling Price',
                      hintText: '100 ETB',
                      number: true,
                      controller: _sellingPriceController,
                      suffixIcon: const Icon(
                        Icons.currency_exchange_rounded,
                        size: kIconSizeSmall,
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          ref
                              .read(revenuePercentageProvider.notifier)
                              .updateRevenuePercentage(
                                double.parse(
                                  (double.parse(value) /
                                          double.parse(
                                            _purchasePriceController.text,
                                          ) *
                                          100)
                                      .toStringAsFixed(2),
                                ),
                              );
                        }
                      },
                      obscureText: false,
                    ),
                  ),
                  const Gap(12),
                  Expanded(
                    child: CustomTextField(
                      hintText: '150',
                      lableText: 'Revenue',
                      number: true,
                      controller: _revenueController,
                      suffixIcon: const Icon(
                        Icons.percent_rounded,
                        size: kIconSizeSmall,
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          _sellingPriceController.text = (double.parse(value) /
                                  100 *
                                  double.parse(_purchasePriceController.text))
                              .toStringAsFixed(2);
                        }
                      },
                      obscureText: false,
                    ),
                  ),
                ],
              ),
              const Gap(24),
              CustomTextField(
                lableText: 'Stock Quantity',
                hintText: '100',
                number: true,
                controller: _stockQuantityController,
                suffixIcon: const Icon(
                  Icons.inventory_2_rounded,
                  size: kIconSizeSmall,
                ),
                obscureText: false,
              ),
              const Gap(32),
              BottomSheetDropdown(
                initialItems: [
                  DropdownItem(
                    title: "Item 1",
                    subtitle: "Description 1",
                    imageUrl: "https://placehold.co/600x400/png",
                  ),
                  DropdownItem(
                    title: "Item 2",
                    subtitle: "Description 2",
                    imageUrl: "https://placehold.co/600x400/png",
                  ),
                  DropdownItem(
                    title: "Item 3",
                    subtitle: "Description 3",
                    imageUrl: "https://placehold.co/600x400/png",
                  ),
                  DropdownItem(
                    title: "Item 4",
                    subtitle: "Description 4",
                    imageUrl: "https://placehold.co/600x400/png",
                  ),
                  DropdownItem(
                    title: "Item 5",
                    subtitle: "Description 5",
                    imageUrl: "https://placehold.co/600x400/png",
                  ),
                  DropdownItem(
                    title: "Item 6",
                    subtitle: "Description 6",
                    imageUrl: "https://placehold.co/600x400/png",
                  ),
                  DropdownItem(
                    title: "Item 7",
                    subtitle: "Description 7",
                    imageUrl: "https://placehold.co/600x400/png",
                  ),
                ],
                hintText: "Supplier",
                title: "Supplier",
                onItemSelected: (item) {
                  _supplierController.text = item.title;
                },
              ),
              const Gap(48),
              BFilledButton(
                isLoading: false,
                color: kColorSchemeSeed,
                text: 'Submit',
                padding: 0,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
