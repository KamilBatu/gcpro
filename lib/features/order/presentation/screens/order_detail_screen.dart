import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class OrderDetailScreen extends ConsumerWidget {
  const OrderDetailScreen({
    @PathParam('orderId') required this.orderId,
    @QueryParam('type') this.orderType = 'sale',
    super.key,
  });

  final String orderId;
  final String orderType;
  static const routeName = '/OrderDetailScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Fetch order details using orderId and orderType
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${orderType == 'sale' ? 'Sale'.hardcoded : 'Purchase'.hardcoded} ${"Order Details".hardcoded}',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.edit_outlined),
          //   onPressed: () {
          //   },
          // ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => _showOrderActions(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildOrderStatusBar(context),
            Padding(
              padding: kP20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildOrderHeader(context),
                  const Gap(24),
                  _buildPartyDetails(context),
                  const Gap(24),
                  _buildOrderItems(context),
                  const Gap(24),
                  _buildOrderSummary(context),
                  const Gap(24),
                  _buildAdditionalDetails(context),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomActions(context),
    );
  }

  Widget _buildOrderStatusBar(BuildContext context) {
    return Container(
      color: Colors.green[700],
      padding: kP16,
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.white),
          const Gap(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Status'.hardcoded,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                    ),
              ),
              Text(
                'Confirmed', // TODO: Get actual status
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
          const Spacer(),
          TextButton.icon(
            icon: const Icon(Icons.history, color: Colors.white),
            label: Text(
              'View History'.hardcoded,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            onPressed: () {
              // TODO: Show order history
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOrderHeader(BuildContext context) {
    return Card(
      child: Padding(
        padding: kP16,
        child: Column(
          children: [
            _buildInfoRow(
              context,
              'Order Number'.hardcoded,
              '#ORD-2024-001', // TODO: Get actual order number
            ),
            const Divider(),
            _buildInfoRow(
              context,
              'Order Date'.hardcoded,
              'March 15, 2024', // TODO: Get actual date
            ),
            const Divider(),
            _buildInfoRow(
              context,
              'Due Date'.hardcoded,
              'March 30, 2024', // TODO: Get actual due date
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPartyDetails(BuildContext context) {
    final isCustomer = orderType == 'sale';
    return Card(
      child: Padding(
        padding: kP16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isCustomer
                  ? 'Customer Details'.hardcoded
                  : 'Supplier Details'.hardcoded,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(16),
            _buildInfoRow(
              context,
              'Name'.hardcoded,
              'John Doe', // TODO: Get actual name
            ),
            const Divider(),
            _buildInfoRow(
              context,
              'Contact'.hardcoded,
              '+251 911 234 567', // TODO: Get actual contact
            ),
            const Divider(),
            _buildInfoRow(
              context,
              'Address'.hardcoded,
              'Addis Ababa, Ethiopia', // TODO: Get actual address
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItems(BuildContext context) {
    return Card(
      child: Padding(
        padding: kP16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Items'.hardcoded,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3, // TODO: Get actual items count
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return _buildOrderItemTile(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItemTile(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text('Product Name'.hardcoded), // TODO: Get actual product name
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${"Qty".hardcoded}: 10 x ${"ETB".hardcoded} 100.00', // TODO: Get actual quantity and price
            style: Theme.of(context).textTheme.bodySmall,
          ),
          if (orderType == 'purchase')
            Text(
              '${"Expected".hardcoded}: March 20, 2024', // TODO: Get actual expected date
              style: Theme.of(context).textTheme.bodySmall,
            ),
        ],
      ),
      trailing: Text('${"ETB".hardcoded} 1,000.00'), // TODO: Get actual total
    );
  }

  Widget _buildOrderSummary(BuildContext context) {
    return Card(
      child: Padding(
        padding: kP16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary'.hardcoded,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(16),
            _buildInfoRow(context, 'Subtotal'.hardcoded, 'ETB 3,000.00'),
            const Divider(),
            _buildInfoRow(context, 'Tax (15%)'.hardcoded, 'ETB 450.00'),
            const Divider(),
            _buildInfoRow(
              context,
              'Total'.hardcoded,
              '${"ETB".hardcoded} 3,450.00',
              isTotal: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditionalDetails(BuildContext context) {
    return Card(
      child: Padding(
        padding: kP16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Additional Details'.hardcoded,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(16),
            _buildInfoRow(
              context,
              'Payment Status'.hardcoded,
              'Partially Paid', // TODO: Get actual payment status
            ),
            const Divider(),
            _buildInfoRow(
              context,
              'Payment Terms'.hardcoded,
              'Net 15', // TODO: Get actual payment terms
            ),
            const Divider(),
            _buildInfoRow(
              context,
              'Notes'.hardcoded,
              'Deliver to warehouse 2', // TODO: Get actual notes
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    String label,
    String value, {
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        Text(
          value,
          style: isTotal
              ? Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: kColorSchemeSeed,
                    fontWeight: FontWeight.bold,
                  )
              : Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildBottomActions(BuildContext context) {
    return Container(
      padding: kP16,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: const [kShadow2],
      ),
      child: Row(
        children: [
          Expanded(
            child: BFilledButton(
              isLoading: false,
              icon: const [
                Icon(Icons.receipt_long, color: Colors.white),
                Gap(8),
              ],
              text: 'Invoice'.hardcoded,
              padding: 3,
              onPressed: () {},
            ),
          ),
          const Gap(16),
          Expanded(
            child: BFilledButton(
              isLoading: false,
              icon: const [
                Icon(Icons.share, color: Colors.white),
                Gap(8),
              ],
              text: 'Share Order'.hardcoded,
              padding: 3,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  void _showOrderActions(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => Padding(
        padding: kP16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.print),
              title: const Text('Print Order'),
              onTap: () {
                // TODO: Print order
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.copy),
              title: const Text('Duplicate Order'),
              onTap: () {
                // TODO: Duplicate order
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.cancel_outlined),
              title: const Text('Cancel Order'),
              textColor: Theme.of(context).colorScheme.error,
              iconColor: Theme.of(context).colorScheme.error,
              onTap: () {
                // TODO: Cancel order
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
