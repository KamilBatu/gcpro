import 'package:gcpro_design_system/tokens/tokens.dart';
import 'package:gcpro/gen/l10n.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Item extends StatelessWidget {
  const Item({
    required this.date,
    required this.status,
    required this.color,
    required this.count,
    required this.vendor,
    required this.label,
    required this.memo,
    required this.sku,
    super.key,
  });
  final String date;
  final String status;
  final Color color;
  final String count;
  final String vendor;
  final String label;
  final String memo;
  final String sku;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          backgroundColor: Theme.of(context).colorScheme.surface,
          showDragHandle: true,
          elevation: 10,
          builder: (context) => SizedBox(
            height: 350,
            child: InventoryDetailsContainer(
              inventoryItem: InventoryItem(
                productName: "Aspirin 500mg",
                batchNumber: "BATCH-202403",
                expiryDate: DateTime(2025, 6, 30),
                purchasePrice: 8.99,
                sellingPrice: 12.50,
                stockQuantity: 500,
                supplier: "MediSupply Ltd.",
                dateReceived: DateTime(2024, 2, 10),
                imageUrl: "https://fakeimg.pl/600x400",
              ),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(21, 139, 139, 139),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: color.withAlpha(50),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: color, width: 1.5),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  count,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InventoryItem {
  InventoryItem({
    required this.productName,
    required this.batchNumber,
    required this.expiryDate,
    required this.purchasePrice,
    required this.sellingPrice,
    required this.stockQuantity,
    required this.supplier,
    required this.dateReceived,
    required this.imageUrl,
  });
  final String productName;
  final String batchNumber;
  final DateTime expiryDate;
  final double purchasePrice;
  final double sellingPrice;
  final int stockQuantity;
  final String supplier;
  final DateTime dateReceived;
  final String imageUrl;
}

class InventoryDetailsContainer extends StatelessWidget {
  const InventoryDetailsContainer({
    required this.inventoryItem,
    super.key,
  });
  final InventoryItem inventoryItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kP20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            inventoryItem.productName,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kColorSchemeSeed,
                ),
          ),
          const Gap(10),
          SizedBox(
            height: 250,
            child: InventoryInfo(inventoryItem: inventoryItem),
          ),
        ],
      ),
    );
  }
}

// 🔹 Inventory Info Rows
class InventoryInfo extends StatelessWidget {
  const InventoryInfo({required this.inventoryItem, super.key});
  final InventoryItem inventoryItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailRow(title: "Batch Number", value: inventoryItem.batchNumber),
        DetailRow(
          title: AppLocalizations.of(context).expiry_date,
          value: "${inventoryItem.expiryDate.toLocal()}".split(' ')[0],
        ),
        DetailRow(
          title: AppLocalizations.of(context).purchase_price,
          value: "\$${inventoryItem.purchasePrice.toStringAsFixed(2)}",
        ),
        DetailRow(
          title: AppLocalizations.of(context).selling_price,
          value: "\$${inventoryItem.sellingPrice.toStringAsFixed(2)}",
        ),
        DetailRow(
          title: AppLocalizations.of(context).stock_quantity,
          value: inventoryItem.stockQuantity.toString(),
        ),
        DetailRow(
          title: AppLocalizations.of(context).supplier,
          value: inventoryItem.supplier,
        ),
        DetailRow(
          title: AppLocalizations.of(context).date_received,
          value: "${inventoryItem.dateReceived.toLocal()}".split(' ')[0],
        ),
      ],
    );
  }
}

// 🔹 Reusable Detail Row
class DetailRow extends StatelessWidget {
  const DetailRow({required this.title, required this.value, super.key});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPv6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(value, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
