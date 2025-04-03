import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_sysytem.dart';
import 'package:gcpro/features/inventory/presentation/providers/state/filter_state_provider.dart';
import 'package:gcpro/features/inventory/presentation/screens/product_details_screen.dart';
import 'package:gcpro/features/inventory/presentation/widgets/date_range_picker.dart';
import 'package:gcpro/features/inventory/presentation/widgets/item_state.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

@RoutePage()
class InventoryDetailScreen extends StatelessWidget {
  const InventoryDetailScreen({super.key});
  static const routeName = '/InventoryDetailScreen';

  static const List<Map<String, dynamic>> inventoryData = [
    {
      "date": "25/05/2023 10:40PM",
      "status": "Added",
      "count": "200 pcs",
      "color": Colors.green,
      "vendor": "Vendor Name",
      "label": "Vendor",
      "memo": "Ref. Memo",
      "sku": "SKU: 123456",
    },
    {
      "date": "02/06/2023 11:40PM",
      "status": "Out",
      "count": "20 pcs",
      "color": Colors.red,
      "vendor": "Vendor Name",
      "label": "Vendor",
      "memo": "Ref. Memo",
      "sku": "SKU: 123456",
    },
    {
      "date": "03/06/2023 09:30PM",
      "status": "Out",
      "count": "10 pcs",
      "color": Colors.red,
      "vendor": "Vendor Name",
      "label": "Vendor",
      "memo": "Ref. Memo",
      "sku": "SKU: 123456",
    },
    {
      "date": "04/06/2023 02:29PM",
      "status": "Out",
      "count": "20 pcs",
      "color": Colors.red,
      "vendor": "Vendor Name",
      "label": "Vendor",
      "memo": "Ref. Memo",
      "sku": "SKU: 123456",
    },
    {
      "date": "09/06/2023 02:30PM",
      "status": "Added",
      "count": "100 pcs",
      "color": Colors.green,
      "vendor": "Vendor Name",
      "label": "Vendor",
      "memo": "Ref. Memo",
      "sku": "SKU: 123456",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Collapsible App Bar
          SliverAppBar(
            pinned: true,
            expandedHeight: 65,
            backgroundColor: kColorSchemeSeed,
            elevation: 0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                "INVENTORY ITEM DETAIL",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          // Main Content
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Date Range and Filter
                      const DateRangePickerWidget(),
                      const Gap(16),

                      // Item Summary
                      Container(
                        decoration: BoxDecoration(
                          color: kColorSchemeSeed,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: const [kShadow1],
                        ),
                        child: Material(
                          color: kColorTransparent,
                          borderRadius: kBorderRadius25,
                          child: InkWell(
                            onTap: () {
                              AutoRouter.of(context).push(
                                ProductDetailsRoute(
                                  product: const Product(
                                    productName: "Aspirin 500mg",
                                    productCode: "ASP-500",
                                    category: "Medicine",
                                    brand: "Bayer",
                                    description:
                                        "Aspirin is used to reduce fever and relieve mild to moderate pain.",
                                    unit: "Box of 100 tablets",
                                    defaultPrice: 12.50,
                                    imageUrl: "https://fakeimg.pl/600x400",
                                  ),
                                ),
                              );
                            },
                            splashColor: kColorWhite25,
                            borderRadius: kBorderRadius25,
                            child: const Padding(
                              padding: kP16,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.tire_repair,
                                          color: kColorBlack,
                                        ),
                                      ),
                                      Gap(10),
                                      Text(
                                        "185/75 R15-70v",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                            255,
                                            246,
                                            246,
                                            246,
                                          ),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "220 pcs",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Gap(24),

                      // Filter Buttons
                      const Row(
                        children: [
                          _FilterButton(label: "all"),
                          _FilterButton(label: "added"),
                          _FilterButton(label: "out"),
                        ],
                      ),
                      const Gap(16),

                      // Inventory List
                      Consumer(
                        builder: (context, ref, child) {
                          final filterStatusState =
                              ref.watch(filterStatusStateProvider);
                          final filterDateRangeState =
                              ref.watch(filterDateRangeStateProvider);
                          var filteredData = inventoryData.where((itemData) {
                            if (filterStatusState == FilterStatus.all) {
                              return true;
                            }
                            return itemData["status"]
                                    .toString()
                                    .toLowerCase() ==
                                filterStatusState.name.toLowerCase();
                          }).toList();

                          DateTime parseDate(String dateString) {
                            final dateFormat = DateFormat("dd/MM/yyyy hh:mma");
                            return dateFormat.parse(dateString);
                          }

                          filteredData = filteredData.where((itemData) {
                            final itemDate =
                                parseDate(itemData["date"].toString());
                            return itemDate
                                    .isAfter(filterDateRangeState.start) &&
                                itemDate.isBefore(filterDateRangeState.end);
                          }).toList();

                          return Column(
                            children: filteredData
                                .map(
                                  (itemData) => Item(
                                    date: itemData["date"] as String,
                                    status: itemData["status"] as String,
                                    count: itemData["count"] as String,
                                    color: itemData["color"] as Color,
                                    vendor: itemData["vendor"] as String,
                                    label: itemData["label"] as String,
                                    memo: itemData["memo"] as String,
                                    sku: itemData["sku"] as String,
                                  ),
                                )
                                .toList(),
                          );
                        },
                      ),

                      const Gap(80),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(RecieveInventoryRoute());
        },
        backgroundColor: kColorSchemeSeed,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

// Widget for Filter Buttons
class _FilterButton extends ConsumerWidget {
  const _FilterButton({
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterStatusStateProvider);
    return Container(
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: filterState.name == label
            ? kColorSchemeSeed
            : const Color.fromARGB(60, 158, 158, 158),
        borderRadius: kBorderRadius25,
      ),
      child: InkWell(
        onTap: () {
          ref.read(filterStatusStateProvider.notifier).updateFilterState(
                label == "all"
                    ? FilterStatus.all
                    : label == "added"
                        ? FilterStatus.added
                        : FilterStatus.out,
              );
        },
        borderRadius: kBorderRadius25,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (filterState.name == label)
                const Icon(Icons.check, color: Colors.white, size: 16),
              if (filterState.name == label) const Gap(4),
              Text(
                label.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                      filterState.name == label ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
