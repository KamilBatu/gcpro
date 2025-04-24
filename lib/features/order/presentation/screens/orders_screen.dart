import 'package:auto_route/auto_route.dart';
import 'package:gcpro/features/order/presentation/screens/orders_mobile_screen.dart';
import 'package:gcpro/shared/utils/responsive/screen_type_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  static const routeName = '/OrdersScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ScreenTypeLayout(
          mobile: OrdersMobileScreen(),
          tablet: OrdersMobileScreen(),
          desktop: OrdersMobileScreen(),
        ),
      ),
    );
  }
}
