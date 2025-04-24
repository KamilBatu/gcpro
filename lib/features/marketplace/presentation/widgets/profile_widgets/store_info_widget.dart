import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/tokens/colors.dart';
import 'package:gcpro/features/marketplace/presentation/providers/toggle_provider.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/eleveted_icon_button.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoreInfoWidget extends StatelessWidget {
  const StoreInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: ShopTile()),
          Padding(padding: EdgeInsets.all(10), child: FollowTile()),
        ],
      ),
    );
  }
}

class ShopTile extends StatelessWidget {
  const ShopTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          context.router.push(SellerInformation());
        },
        child: const CircleAvatar(
          radius: 24,
          backgroundColor: kColorSchemeSeed,
          child: Icon(
            Icons.abc,
            size: 28,
          ),
        ),
      ),
      title: GestureDetector(
        onTap: () {
          context.router.push(SellerInformation());
        },
        child: GestureDetector(
          onTap: () {
            context.router.push(SellerInformation());
          },
          child: Text(
            'wholesale',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: kColorWhite),
          ),
        ),
      ),
      subtitle: Text(
        '5 followers',
        style:
            Theme.of(context).textTheme.bodySmall?.copyWith(color: kColorWhite),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}

class FollowTile extends StatelessWidget {
  const FollowTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Consumer(
          builder: (context, ref, child) {
            final toggle = ref.watch(toggleNotifierProvider);

            return CustomElevatedIconButton(
              label: toggle ? 'Follow' : 'unfollow',
              icon: toggle ? Icons.add : Icons.remove,
              backgroundColor: toggle ? kColorBlack : kColorWhite,
              foregroundColor: toggle ? kColorWhite : kColorBlack,
              onPressed: () {
                ref.read(toggleNotifierProvider.notifier).toggle();
              },
            );
          },
        )
      ],
    );
  }
}
