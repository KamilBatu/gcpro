import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/features/dashboard/presentation/widgets/drawer.dart';
import 'package:gcpro/routes/app_route.gr.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

@RoutePage()
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});
  static const routeName = '/dashboardScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      scaffoldKey: scaffoldKey,
      routes: const [
        HomeRoute(),
        InventoryRoute(),
        MarketPlaceRoute(),
        OrdersRoute(),
        ChatRoute(),
      ],
      drawer: const BitaDrawer(),
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: kColorSchemeSeed,
          unselectedItemColor: Theme.of(context).unselectedWidgetColor,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Inventory',
              icon: Icon(Icons.inventory_2),
            ),
            BottomNavigationBarItem(
              label: 'Market Place',
              icon: Icon(Icons.point_of_sale),
            ),
            BottomNavigationBarItem(
              label: 'Orders',
              icon: Icon(Icons.shopping_cart_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Chats',
              icon: Icon(Icons.chat_bubble_outline),
            ),
          ],
        );
      },
    );
  }
}
