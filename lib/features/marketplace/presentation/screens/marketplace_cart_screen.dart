import 'package:auto_route/annotations.dart';

import 'package:flutter/material.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/carts_widgets/cart_bottom_bars.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/carts_widgets/cart_checkbox_widget.dart';

@RoutePage()
class MarketplaceCartScreen extends StatelessWidget {
  const MarketplaceCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 0.3,
            ),
            child: CartCheckboxWidget(
              title: 'productTitle',
              subtitle: 'subtitle',
              price: 300,
              imageUrl:
                  'https://cdn.pixabay.com/photo/2020/12/03/06/41/pills-5799622_1280.jpg',
            ),
          );
        },
      ),
      bottomNavigationBar: CartBottomBar(
        isAllSelected: true,
        onAllSelectedChanged: () {},
        onCheckoutPressed: () {},
        totalAmount: '900',
        cartCount: 2,
      ),
    );
  }
}
