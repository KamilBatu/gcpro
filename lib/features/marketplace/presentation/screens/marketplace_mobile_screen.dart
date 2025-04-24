import 'package:gcpro/features/marketplace/presentation/providers/colors_provider.dart';
import 'package:gcpro/features/marketplace/presentation/screens/marketplace_products.dart';
import 'package:gcpro/features/marketplace/presentation/screens/marketplace_wholesale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MarketplaceMobileScreen extends ConsumerWidget {
  const MarketplaceMobileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorProvid = ref.watch(colorsProvider);
    return DefaultTabController(
      length: 2,
      child: Container(
        color: colorProvid.backgroundColor,
        child: SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    color: colorProvid.backgroundColor,
                    child: TabBar(
                      isScrollable: true,
                      onTap: (value) {
                        if (value == 0) {
                          print(value);
                        } else {
                          print(value);
                        }
                      },
                      indicatorColor: colorProvid.foregroundColor,
                      indicatorPadding: EdgeInsets.symmetric(vertical: 6),
                      labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                      dividerColor: Colors.transparent,
                      tabs: [
                        Tab(
                          child: Text(
                            'Products',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: colorProvid.whiteblack,
                                    ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Wholesalers',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: colorProvid.whiteblack,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                MarketplaceProducts(),
                MarketplaceWholesale(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//  Positioned(   top: 0,
//                     right: 10,
//                     child: BadgeCartIcon(
//                       cartCount: marketCartProvider.items.length,
//                       iconColor: colorProvide.cartColor,
//                       iconSize: 20,
//                       badgeSize: 18,
//                       onPressed: () {
//                         context.router.push(MarketplaceCartRoute());
//                       },
//                     ),
//                   ),
