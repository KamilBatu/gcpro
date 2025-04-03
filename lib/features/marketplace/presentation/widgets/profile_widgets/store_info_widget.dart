import 'package:gcpro_design_system/tokens/colors.dart';
import 'package:flutter/material.dart';

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
      leading: CircleAvatar(
        radius: 18,
        child: Icon(
          Icons.shop,
          size: 20,
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      title: Text(
        'shopName',
        style:
            Theme.of(context).textTheme.bodyLarge?.copyWith(color: kColorWhite),
      ),
      subtitle: Text(
        '1.2k followers',
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
        const CircleAvatar(
          backgroundColor: kColorWhite,
          radius: 18,
          child: Icon(
            Icons.chat,
            color: kColorBlack50,
            size: 20,
          ),
        ),
        const SizedBox(width: 5),
        ElevatedButton.icon(
          onPressed: () {},
          label: Text(
            'Follow',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: kColorWhite),
          ),
          icon: const Icon(
            Icons.add,
            color: kColorWhite,
          ),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              minimumSize: const Size(0, 36),
              backgroundColor: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }
}
