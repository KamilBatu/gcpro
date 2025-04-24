import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class SalesOrdersScreen extends ConsumerWidget {
  const SalesOrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // This would typically come from a provider
    final salesOrders = List.generate(
      15,
      (index) => SalesOrder(
        id: 'SO-${1000 + index}',
        customerName: 'Customer ${index + 1}',
        date: DateTime.now().subtract(Duration(days: index)),
        total: (index + 1) * 1250.0,
        status: OrderStatus.values[index % OrderStatus.values.length],
      ),
    );

    return Stack(
      children: [
        ListView.builder(
          itemCount: salesOrders.length,
          itemBuilder: (context, index) {
            final order = salesOrders[index];
            return OrderCard(
              title: order.customerName,
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
            heroTag: 'add_sales_order',
            child: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              // Navigate to add new sales order
              context.router.push(const AddOrderRoute());
            },
          ),
        ),
      ],
    );
  }
}

// Sample data model
class SalesOrder {
  SalesOrder({
    required this.id,
    required this.customerName,
    required this.date,
    required this.total,
    required this.status,
  });

  final String id;
  final String customerName;
  final DateTime date;
  final double total;
  final OrderStatus status;
}

enum OrderStatus { pending, completed, canceled }

// Order card widget used by both sales and purchase orders
class OrderCard extends StatelessWidget {
  const OrderCard({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.amount,
    required this.status,
    required this.onTap,
    super.key,
  });

  final String title;
  final String subtitle;
  final DateTime date;
  final String amount;
  final OrderStatus status;
  final VoidCallback onTap;

  Color _getStatusColor() {
    switch (status) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.completed:
        return Colors.green;
      case OrderStatus.canceled:
        return Colors.red;
    }
  }

  String _getStatusText() {
    switch (status) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.completed:
        return 'Completed';
      case OrderStatus.canceled:
        return 'Canceled';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: kPb10,
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: kP16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    amount,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: kColorSchemeSeed,
                        ),
                  ),
                ],
              ),
              const Gap(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    '${date.day}/${date.month}/${date.year}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const Gap(8),
              Container(
                padding: kPh12v8,
                decoration: BoxDecoration(
                  color: _getStatusColor().withAlpha(25),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  _getStatusText(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: _getStatusColor(),
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
