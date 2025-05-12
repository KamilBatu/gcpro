import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gcpro/features/auth/presentation/providers/auth_providers.dart';
import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:gcpro/l10n/string_hardcoded.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BitaDrawer extends ConsumerWidget {
  const BitaDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  children: [
                    DrawerItem(
                      icon: Icons.credit_card,
                      text: AppLocalizations.of(context)
                          .payment_methods
                          .hardcoded,
                    ),
                    DrawerItem(
                      icon: Icons.account_balance_wallet,
                      text: AppLocalizations.of(context).finances.hardcoded,
                    ),
                    DrawerItem(
                      icon: Icons.card_giftcard,
                      text: AppLocalizations.of(context).gifts_cards.hardcoded,
                    ),
                    DrawerItem(
                      icon: Icons.bar_chart,
                      text: AppLocalizations.of(context)
                          .reports_and_analytics
                          .hardcoded,
                    ),
                    DrawerItem(
                      icon: Icons.store,
                      text: AppLocalizations.of(context).stores.hardcoded,
                    ),
                    DrawerItem(
                      icon: Icons.settings,
                      text: AppLocalizations.of(context).settings.hardcoded,
                      onTap: () => context.router.push(const SettingsRoute()),
                    ),
                    DrawerItem(
                      icon: Icons.logout,
                      text: AppLocalizations.of(context).logout.hardcoded,
                      onTap: () => context.router.replace(LoginRoute()),
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
  const DrawerItem({
    required this.icon,
    required this.text,
    this.onTap,
    super.key,
  });

  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPb10,
      child: InkWell(
        splashColor: kColorSchemeSeed.withAlpha(100),
        onTap: onTap ?? () {},
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
