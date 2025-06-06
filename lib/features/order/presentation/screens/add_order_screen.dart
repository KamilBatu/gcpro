import 'package:auto_route/auto_route.dart';
import 'package:gcpro/features/order/presentation/screens/inventory_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AddOrderScreen extends ConsumerWidget {
  const AddOrderScreen({super.key});
  static const routeName = '/AddOrderScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InventoryCartPage();
  }
}
