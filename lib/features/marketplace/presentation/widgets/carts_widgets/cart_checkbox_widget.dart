import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/tokens/tokens.dart';
import 'package:gcpro/features/marketplace/domain/entities/cart_entity.dart';
import 'package:gcpro/features/marketplace/domain/entities/product_entity.dart';
import 'package:gcpro/features/marketplace/presentation/providers/marketplace_cart_provider.dart';
import 'package:gcpro/features/marketplace/presentation/providers/text_controller_provider.dart';
import 'package:gcpro/features/marketplace/presentation/providers/toggle_provider.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/quantity_selecter.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartCheckboxWidget extends ConsumerWidget {
  final String title;
  final String subtitle;
  final String price;
  final int quantity;
  final Product product;

  const CartCheckboxWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.quantity,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(marketPlaceCartProvider);
    final isSelected = cart.items
        .firstWhere(
          (item) => item.product.id == product.id,
          orElse: () => CartItem(
            id: product.id,
            product: product,
            singleCartPrice: 0,
            quantity: 0,
            isSelected: false,
          ),
        )
        .isSelected;

    return Container(
      decoration: BoxDecoration(
        color: kColorWhite,
        borderRadius: BorderRadius.circular(1),
        boxShadow: const [
          BoxShadow(
            color: kColorBlack25,
            spreadRadius: 0.5,
            blurRadius: 3,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 7.0),
        leading: GestureDetector(
          onTap: () {
            ref.read(isOneSelectedProvider(product.id).notifier).toggle();
            ref.read(marketPlaceCartProvider.notifier).toggleItemSelection(
                  product.id,
                );
            if (isSelected == true) {
              ref.read(isAllSelectedProvider.notifier).state = false;
            }
          },
          child: Container(
            width: 18.0,
            height: 18.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? kColorWhite : kColorBlack,
                width: 1.0,
              ),
            ),
            child: isSelected
                ? const Icon(
                    Icons.check_circle,
                    size: 18.0,
                    color: kColorSchemeSeed,
                  )
                : null,
          ),
        ),
        title: _buildContent(context, ref),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildImageSection(context, ref),
        const SizedBox(width: 10.0),
        Expanded(child: _buildDetailsSection(context, ref)),
      ],
    );
  }

  Widget _buildImageSection(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () =>
              context.router.replace(ProductDetailRoute(id: product.id)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              product.imageUrl,
              width: MediaQuery.sizeOf(context).width * 0.25,
              height: MediaQuery.sizeOf(context).height * 0.13,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Text('Ximage');
              },
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            color: kColorBlack50,
            width: MediaQuery.sizeOf(context).width * 0.25,
            height: MediaQuery.sizeOf(context).height * 0.13 / 4,
            child: Center(
              child: Text(
                'kamil-barca',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: kColorWhite),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsSection(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.47,
      height: MediaQuery.sizeOf(context).height * 0.17,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleSubtitle(context),
          _buildViewProfile(context, ref),
          _buildPriceQuantity(context, ref, quantity),
        ],
      ),
    );
  }

  Widget _buildTitleSubtitle(BuildContext context) {
    return Expanded(
      child: ListTile(
        contentPadding: const EdgeInsets.only(top: 10),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }

  Widget _buildViewProfile(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ListTile(
        contentPadding: const EdgeInsets.only(top: 8),
        title: GestureDetector(
          onTap: () => context.router.push(SellerProfileRoute()),
          child: Text(
            'checkout-shop>',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: kColorSchemeSeed),
          ),
        ),
      ),
    );
  }

  Widget _buildPriceQuantity(
      BuildContext context, WidgetRef ref, int quantity) {
    return ListTile(
      contentPadding: const EdgeInsets.only(bottom: 1),
      leading: Text(
        '$price ETB',
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: Consumer(
        builder: (context, ref, child) {
          final cart = ref.watch(marketPlaceCartProvider);
          final currentQuantity = cart.items
              .firstWhere(
                (item) => item.product.id == product.id,
                orElse: () => CartItem(
                  id: product.id,
                  product: product,
                  singleCartPrice: 0,
                  quantity: 0,
                  isSelected: false,
                ),
              )
              .quantity;

          return QuantitySelector(
            width: MediaQuery.sizeOf(context).width * 0.2,
            height: MediaQuery.sizeOf(context).height * 0.035,
            quantity: currentQuantity,
            onAdd: () => ref
                .read(marketPlaceCartProvider.notifier)
                .addInCart(product, ref),
            onRemove: () => ref
                .read(marketPlaceCartProvider.notifier)
                .reduceInCart(product, ref),
            onQuantityChanged: (newQuantity) {
              ref
                  .read(marketPlaceCartProvider.notifier)
                  .updateQuantity(product, ref, newQuantity.toString());
            },
          );
        },
      ),
    );
  }
}
