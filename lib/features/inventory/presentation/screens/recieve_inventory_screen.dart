import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/features/inventory/presentation/providers/state/recieve_inventory_state_provider.dart';
import 'package:gcpro/features/inventory/presentation/widgets/bottomsheet_dropdown.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:gcpro/l10n/string_hardcoded.dart';
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
        title: Text(
          'Receive Inventory',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: kColorWhite,
              ),
        ),
        foregroundColor: kColorWhite,
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
                hintText: AppLocalizations.of(context).product,
                title: AppLocalizations.of(context).product,
                defaultItem: defaultProduct,
                onItemSelected: (item) {
                  _productController.text = item.title;
                },
              ),
              const Gap(24),
              CustomTextField(
                lableText: AppLocalizations.of(context).batch_number.hardcoded,
                hintText: 'BASD-123456',
                controller: _batchNumberController,
                suffixIcon: const Icon(
                  Icons.batch_prediction_rounded,
                  size: kIconSizeSmall,
                ),
              ),
              const Gap(24),
              CustomTextField(
                lableText: AppLocalizations.of(context).expiry_date.hardcoded,
                hintText: '2025-01-01',
                date: true,
                controller: _expiryDateController,
                suffixIcon: const Icon(
                  Icons.calendar_month_rounded,
                  size: kIconSizeSmall,
                ),
              ),
              const Gap(24),
              CustomTextField(
                lableText:
                    AppLocalizations.of(context).purchase_price.hardcoded,
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
              ),
              const Gap(24),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextField(
                      lableText:
                          AppLocalizations.of(context).selling_price.hardcoded,
                      hintText: '100 ETB',
                      number: true,
                      controller: _sellingPriceController,
                      suffixIcon: const Icon(
                        Icons.currency_exchange_rounded,
                        size: kIconSizeSmall,
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          if (_purchasePriceController.text.isNotEmpty) {
                            ref
                                .read(revenuePercentageProvider.notifier)
                                .updateRevenuePercentage(
                                  double.parse(
                                    (double.parse(value) /
                                            (double.tryParse(
                                                  _purchasePriceController.text,
                                                ) ??
                                                1) *
                                            100)
                                        .toStringAsFixed(2),
                                  ),
                                );
                          }
                        }
                      },
                    ),
                  ),
                  const Gap(12),
                  Expanded(
                    child: CustomTextField(
                      lableText: AppLocalizations.of(context).revenue.hardcoded,
                      hintText: '150',
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
                                  (double.tryParse(
                                        _purchasePriceController.text,
                                      ) ??
                                      1))
                              .toStringAsFixed(2);
                        }
                      },
                    ),
                  ),
                ],
              ),
              const Gap(24),
              CustomTextField(
                lableText:
                    AppLocalizations.of(context).stock_quantity.hardcoded,
                hintText: '100',
                number: true,
                controller: _stockQuantityController,
                suffixIcon: const Icon(
                  Icons.inventory_2_rounded,
                  size: kIconSizeSmall,
                ),
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
                hintText: AppLocalizations.of(context).supplier,
                title: AppLocalizations.of(context).supplier,
                onItemSelected: (item) {
                  _supplierController.text = item.title;
                },
              ),
              const Gap(48),
              BFilledButton(
                isLoading: false,
                color: kColorSchemeSeed,
                text: AppLocalizations.of(context).submit.hardcoded,
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
