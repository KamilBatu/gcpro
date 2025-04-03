import 'package:gcpro/features/marketplace/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final AsyncValue<Product> productAsync;

  const ProductDetailAppBar({
    super.key,
    required this.productAsync,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor:
          Theme.of(context).colorScheme.surface, // AppBar background
      elevation: 1, // Optional: subtle shadow for depth
      title: productAsync.when(
        data: (product) => ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Icon(
              Icons.abc,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          title: Text(
            "shopName",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
          ),
          subtitle: Text(
            '4.4★(714)', // Static for now
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          trailing: Icon(
            Icons.more_horiz,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        loading: () => ListTile(
          leading: Icon(
            Icons.abc,
            color: Theme.of(context).colorScheme.onSurface,
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
          trailing: Icon(
            Icons.more_vert,
            color: Theme.of(context).colorScheme.onSurface,
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
