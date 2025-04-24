import 'package:auto_route/auto_route.dart';
import 'package:gcpro/features/marketplace/presentation/providers/marketplace_cart_provider.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/badge_cart_icon.dart';
import 'package:gcpro_design_system/tokens/tokens.dart';
import 'package:gcpro/features/marketplace/domain/entities/product_entity.dart';
import 'package:gcpro/features/marketplace/presentation/screens/seller_profile_screen.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/actionbutton_iconsbutton.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/animated_border.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailAppBar extends ConsumerWidget
    implements PreferredSizeWidget {
  final AsyncValue<Product> productAsync;

  const ProductDetailAppBar({
    super.key,
    required this.productAsync,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketCartProvider = ref.watch(marketPlaceCartProvider);
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 1,
      title: productAsync.when(
        data: (product) => ListTile(
          leading: GestureDetector(
            onTap: () => context.router.push(SellerProfileRoute()),
            child: const AnimatedAvatarBorder(
              drawArc: 0.3,
              radius: 28,
              borderWidth: 1,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: kColorSchemeSeed,
                child: Icon(
                  Icons.abc,
                  color: kColorWhite,
                  size: 32,
                ),
              ),
            ),
          ),
          title: Text(
            "Wholesale",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: kColorBlack,
                  fontWeight: FontWeight.bold,
                ),
          ),
          subtitle: Text(
            '4.4★(714)', // Static for now
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: kColorBlack),
          ),
          trailing: GestureDetector(
            onTap: () {
              context.router.replace(MarketplaceCartRoute());
            },
            child: BadgeCartIcon(
              cartCount: marketCartProvider.items.length,
              iconColor: kColorSchemeSeed,
              iconSize: 24,
              badgeSize: 18,
              onPressed: () {
                context.router.push(MarketplaceCartRoute());
              },
            ),
          ),
        ),
        loading: () => ListTile(
          leading: const Icon(
            Icons.abc,
            color: kColorWhite,
          ),
          title: Text(
            'Loading...',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          subtitle: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        error: (error, stack) => ListTile(
          leading: Icon(
            Icons.abc,
            color: Theme.of(context).colorScheme.error,
          ),
          title: Text(
            'Error',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
          ),
          subtitle: Text(
            error.toString(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onErrorContainer,
                ),
          ),
          trailing: Icon(
            Icons.more_vert,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
