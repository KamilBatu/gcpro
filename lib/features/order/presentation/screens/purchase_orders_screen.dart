import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/features/order/presentation/screens/sales_orders_screen.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class PurchaseOrdersScreen extends ConsumerWidget {
  const PurchaseOrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // This would typically come from a provider
    final purchaseOrders = List.generate(
      10,
      (index) => PurchaseOrder(
        id: 'PO-${2000 + index}',
        supplierName: 'Supplier ${index + 1}',
        date: DateTime.now().subtract(Duration(days: index * 2)),
        total: (index + 2) * 2500.0,
        status: OrderStatus.values[index % OrderStatus.values.length],
      ),
    );

    return Stack(
      children: [
        ListView.builder(
          itemCount: purchaseOrders.length,
          itemBuilder: (context, index) {
            final order = purchaseOrders[index];
            return OrderCard(
              title: order.supplierName,
              subtitle: 'Order #${order.id}',
              date: order.date,
              amount: 'ETB ${order.total.toStringAsFixed(2)}',
              status: order.status,
              onTap: () {
                // Navigate to order details
                context.router.push(OrderDetailRoute(orderId: order.id));
              },
            );
          },
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: FloatingActionButton(
            backgroundColor: kColorSchemeSeed,
            heroTag: 'add_purchase_order',
            child: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              // Navigate to add new purchase order
              context.router.push(const AddOrderRoute());
            },
          ),
        ),
      ],
    );
  }
}

// Sample data model
class PurchaseOrder {
  PurchaseOrder({
    required this.id,
    required this.supplierName,
    required this.date,
    required this.total,
    required this.status,
  });

  final String id;
  final String supplierName;
  final DateTime date;
  final double total;
  final OrderStatus status;
}
