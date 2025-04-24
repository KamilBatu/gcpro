import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/features/inventory/presentation/widgets/product_search_delegation.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Sliver App Bar (Collapsible Header)
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 100,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            foregroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                children: [
                  const Icon(
                    Icons.inventory,
                    color: kColorSchemeSeed,
                    size: 18,
                  ),
                  const Gap(8),
                  Text(
                    AppLocalizations.of(context).inventory,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kColorSchemeSeed,
                    ),
                  ),
                ],
              ),
              centerTitle: false,
              titlePadding: const EdgeInsets.all(16),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.refresh,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: ProductSearchDelegate(),
                  );
                },
              ),
            ],
          ),

          // Sliver Padding for Content
          SliverPadding(
            padding: const EdgeInsets.all(24),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  // Summary Cards
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SummaryCard(
                        title: AppLocalizations.of(context).total_products,
                        value: "128",
                        percentage: "+8.00%",
                        color: kColorStatusCode200,
                      ),
                      SummaryCard(
                        title: AppLocalizations.of(context).stock_in_hand,
                        value: "2,350",
                        percentage: "+2.34%",
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  const Gap(20),

                  // Product List Title
                  Text(
                    AppLocalizations.of(context).products_list,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Gap(10),

                  // Product Items (Scrolls with the whole page)
                  ...List.generate(
                    10,
                    (index) => ProductItem(
                      icon:
                          index.isEven ? Icons.eco : Icons.emoji_food_beverage,
                      name: index.isEven ? "Vegetables" : "Sweet Food",
                      stock: (index * 10).toString(),
                      lowStockLabel: index.isEven ? "Low Stock" : null,
                    ),
                  ),
                ],
              ),
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
        child: const Icon(Icons.add, color: kColorWhite),
      ),
    );
  }
}

// Widget for Summary Card
class SummaryCard extends StatelessWidget {
  const SummaryCard({
    required this.title,
    required this.value,
    required this.percentage,
    required this.color,
    super.key,
  });
  final String title;
  final String value;
  final String percentage;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: kP12,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceDim,
        borderRadius: kBorderRadius12,
        boxShadow: const [kShadow1],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const Gap(5),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(5),
          Row(
            children: [
              Icon(Icons.arrow_upward, color: color, size: 16),
              Text(
                percentage,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget for Product Item
class ProductItem extends StatelessWidget {
  const ProductItem({
    required this.icon,
    required this.name,
    required this.stock,
    super.key,
    this.lowStockLabel,
  });

  final IconData icon;
  final String name;
  final String stock;
  final String? lowStockLabel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        // Navigate to Product Details
        // AutoRouter.of(context).push(const InventoryDetailRoute());
        AutoRouter.of(context).push(const InventoryDetailRoute());
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: kColorSchemeSeed.withAlpha(20),
          child: Icon(icon, color: kColorSchemeSeed),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Row(
          children: [
            Icon(Icons.arrow_upward, color: kColorStatusCode200, size: 16),
            Text(" $stock sold", style: TextStyle(color: kColorStatusCode200)),
            const SizedBox(width: 10),
            if (lowStockLabel != null)
              Container(
                margin: const EdgeInsets.only(left: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: kColorStatusCode400.withAlpha(50),
                  borderRadius: kBorderRadius8,
                ),
                child: Text(
                  lowStockLabel!,
                  style: TextStyle(
                    color: kColorStatusCode400,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
          size: 30,
        ),
      ),
    );
  }
}
