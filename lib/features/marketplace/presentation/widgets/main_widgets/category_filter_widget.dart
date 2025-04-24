// Category Filter Widget
import 'package:gcpro/features/marketplace/presentation/providers/colors_provider.dart';
import 'package:gcpro/features/marketplace/presentation/providers/marketplace_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gcpro_design_system/gcpro_design_system.dart';

class CategoryFilterWidget extends ConsumerWidget {
  const CategoryFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);
    final selectedCategoryId =
        ref.watch(categoriesProvider.notifier).selectedCategoryId;
    final colorProvide = ref.watch(colorsProvider);

    return Container(
      color: Colors.transparent,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.031,
        width: MediaQuery.sizeOf(context).width * 0.99,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: GestureDetector(
                onTap: () {
                  ref
                      .read(categoriesProvider.notifier)
                      .selectCategory2(-1, ref);
                  ref
                      .read(categoriesProvider.notifier)
                      .selectCategory(null, ref);
                },
                child: Text(
                  'Explore',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: selectedCategoryId == -1
                            ? kColorBlack
                            : kColorBlack50,
                      ),
                ),
              ),
            ),
            ...categories.map(
              (category) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: GestureDetector(
                  onTap: () {
                    ref
                        .read(categoriesProvider.notifier)
                        .selectCategory2(category.id, ref);
                    ref
                        .read(categoriesProvider.notifier)
                        .selectCategory(category, ref);
                  },
                  child: Text(
                    '${category.name}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: selectedCategoryId == category.id
                              ? kColorBlack
                              : kColorBlack50,
                          decorationThickness: 2,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
