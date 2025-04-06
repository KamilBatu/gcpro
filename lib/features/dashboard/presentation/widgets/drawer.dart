import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:gcpro/features/auth/presentation/providers/auth.dart';
import 'package:gcpro/features/auth/presentation/providers/auth_providers.dart';
import 'package:gcpro/features/auth/presentation/providers/state/auth_state.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:gcpro/shared/globals.dart';
import 'package:gcpro_design_system/gcpro_design_sysytem.dart';
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
                    const DrawerItem(
                      icon: Icons.credit_card,
                      text: 'Payment Methods',
                    ),
                    const DrawerItem(
                      icon: Icons.account_balance_wallet,
                      text: 'Finances',
                    ),
                    const DrawerItem(
                      icon: Icons.card_giftcard,
                      text: 'Gifts Cards',
                    ),
                    const DrawerItem(
                      icon: Icons.bar_chart,
                      text: 'Reports and Analytics',
                    ),
                    const DrawerItem(
                      icon: Icons.store,
                      text: 'Stores',
                    ),
                    const DrawerItem(
                      icon: Icons.settings,
                      text: 'Settings',
                    ),
                    DrawerItem(
                      icon: Icons.logout,
                      text: 'Logout',
                      func: () async {
                        await ref
                            .read(authNotifierProvider.notifier)
                            .logoutUser();
                        final authState = ref.read(authNotifierProvider);
                        print('Post-logout state: $authState'); // Debug
                        if (authState is AuthSuccess &&
                            authState.success == SuccessState.userLoggedOut) {
                          context.router.replaceAll([const LoginRoute()]);
                        }
                      },
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
  const DrawerItem(
      {required this.icon, required this.text, super.key, this.func});

  final IconData icon;
  final String text;
  final Function? func;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPb10,
      child: InkWell(
        splashColor: kColorSchemeSeed.withAlpha(100),
        onTap: () {
          if (func != null) {
            func!();
          }
        },
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
