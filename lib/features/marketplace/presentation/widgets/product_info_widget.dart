import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/detial_product_provider.dart';

class ProductInfoWidget extends StatelessWidget {
  final String name;
  final double price;
  final String description;

  const ProductInfoWidget({
    super.key,
    required this.name,
    required this.price,
    this.description = 'Detailed description goes here.',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceDim,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Theme.of(context).colorScheme.surface,
            child: ListTile(
              title: Text(
                name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              subtitle: Text(
                'ETB ${price.toString()}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: Consumer(
                builder: (context, ref, child) {
                  final favState = ref.watch(favoriteProvider);
                  return IconButton(
                      onPressed: () {
                        toggleFav(ref);
                      },
                      icon: CircleAvatar(
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest,
                        child: favState
                            ? Icon(
                                Icons.favorite,
                                color: Theme.of(context).colorScheme.secondary,
                              )
                            : Icon(
                                Icons.favorite_border_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                      ));
                },
              ),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
            color: Theme.of(context).colorScheme.surface,
            child: ListTile(
              title: Text(
                description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              subtitle: Text(
                '★★★★★ 17 ratings',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
            color: Theme.of(context).colorScheme.surface,
            child: ListTile(
              title: Text(
                'Product details',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              trailing: Text(
                'report',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
