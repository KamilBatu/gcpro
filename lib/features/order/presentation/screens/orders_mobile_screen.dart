import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/features/order/presentation/widgets/action_button.dart';
import 'package:gcpro/features/order/presentation/widgets/order_summary_card.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrdersMobileScreen extends StatelessWidget {
  const OrdersMobileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kP12,
      child: AutoTabsRouter.tabBar(
        routes: const [
          SalesOrdersRoute(),
          PurchaseOrdersRoute(),
        ],
        builder: (context, child, controller) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 300,
                    collapsedHeight: 40,
                    toolbarHeight: 35,
                    stretch: true,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: kP8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(15),
                            Text(
                              AppLocalizations.of(context).orders,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: kColorSchemeSeed,
                                  ),
                            ),
                            const Gap(20),
                            // Summary Cards - Total Orders and Value
                            Row(
                              children: [
                                Expanded(
                                  child: OrderSummaryCard(
                                    label: AppLocalizations.of(context)
                                        .total_orders,
                                    value: '127',
                                  ),
                                ),
                                const Gap(16),
                                Expanded(
                                  child: OrderSummaryCard(
                                    label: AppLocalizations.of(context)
                                        .total_value,
                                    value:
                                        '125,650 ${AppLocalizations.of(context).etb} ',
                                  ),
                                ),
                              ],
                            ),
                            const Gap(20),
                            // Quick Actions
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Search button
                                ActionButton(
                                  icon: Icons.search,
                                  label: AppLocalizations.of(context).search,
                                  onTap: () {
                                    // Show search dialog
                                  },
                                ),
                                // Filter button
                                ActionButton(
                                  icon: Icons.filter_list,
                                  label: AppLocalizations.of(context).filter,
                                  onTap: () {
                                    // Show filter options
                                  },
                                ),
                                // Add button
                                ActionButton(
                                  icon: Icons.add_circle_outline,
                                  label: AppLocalizations.of(context).new_order,
                                  onTap: () {
                                    // Navigate to add order screen
                                    context.router.push(const AddOrderRoute());
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    bottom: TabBar(
                      labelColor: Colors.white,
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      unselectedLabelColor: Colors.grey,
                      indicator: const BoxDecoration(
                        color: kColorSchemeSeed,
                        borderRadius: kBorderRadius25,
                      ),
                      indicatorAnimation: TabIndicatorAnimation.elastic,
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: kPh8,
                      padding: kPh20,
                      onTap: tabsRouter.setActiveIndex,
                      dividerHeight: 0,
                      controller: controller,
                      tabs: [
                        Tab(text: AppLocalizations.of(context).sales_orders),
                        Tab(text: AppLocalizations.of(context).purchase_orders),
                      ],
                    ),
                  ),
                  SliverFillRemaining(
                    child: Padding(
                      padding: kPh12v8,
                      child: child,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
