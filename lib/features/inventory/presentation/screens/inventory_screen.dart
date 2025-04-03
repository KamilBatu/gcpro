import 'package:auto_route/auto_route.dart';
import 'package:gcpro/features/inventory/presentation/screens/products_screen.dart';
import 'package:gcpro/shared/utils/responsive/screen_type_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class InventoryScreen extends ConsumerWidget {
  const InventoryScreen({super.key});
  static const routeName = '/InventoryScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ScreenTypeLayout(
      mobile: ProductsScreen(),
      tablet: ProductsScreen(),
      desktop: ProductsScreen(),
    );
  }
}
