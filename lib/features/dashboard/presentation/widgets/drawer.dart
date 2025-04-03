import 'package:gcpro_design_system/gcpro_design_sysytem.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BitaDrawer extends StatelessWidget {
  const BitaDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      // backgroundColor: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: kPv20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              // Profile Section
              Padding(
                padding: kP16,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Theme.of(context).colorScheme.surfaceDim,
                      child: const Icon(
                        Icons.image,
                        color: Colors.blueAccent,
                        size: 30,
                      ),
                    ),
                    const Gap(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 12,
                          width: 120,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(51, 124, 155, 255),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const Gap(8),
                        Container(
                          height: 8,
                          width: 80,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(51, 124, 155, 255),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(30),

              // Drawer Items
              Expanded(
                child: ListView(
                  padding: kPv10,
                  children: const [
                    DrawerItem(
                      icon: Icons.credit_card,
                      text: 'Payment Methods',
                    ),
                    DrawerItem(
                      icon: Icons.account_balance_wallet,
                      text: 'Finances',
                    ),
                    DrawerItem(
                      icon: Icons.card_giftcard,
                      text: 'Gifts Cards',
                    ),
                    DrawerItem(
                      icon: Icons.bar_chart,
                      text: 'Reports and Analytics',
                    ),
                    DrawerItem(
                      icon: Icons.store,
                      text: 'Stores',
                    ),
                    DrawerItem(
                      icon: Icons.settings,
                      text: 'Settings',
                    ),
                    DrawerItem(
                      icon: Icons.logout,
                      text: 'Logout',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({required this.icon, required this.text, super.key});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPb10,
      child: InkWell(
        splashColor: kColorSchemeSeed.withAlpha(100),
        onTap: () {},
        child: Padding(
          padding: kPh20v15,
          child: Row(
            children: [
              Icon(icon, color: kColorSchemeSeed, size: kIconSizeMedium),
              const Gap(15),
              Expanded(child: Text(text)),
            ],
          ),
        ),
      ),
    );
  }
}
