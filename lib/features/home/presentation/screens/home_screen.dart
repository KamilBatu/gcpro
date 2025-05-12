import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:gcpro/features/home/presentation/providers/home_provider.dart';
import 'package:gcpro/features/home/presentation/providers/state/account_state.dart';
import 'package:gcpro/features/home/presentation/screens/home_mobile_screen.dart';

import 'package:gcpro/shared/utils/responsive/screen_type_layout.dart';
import 'package:gcpro/shared/widgets/account_drop_down.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static const routeName = '/homeScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(accountProvider);
    final account =
        state is AccountSuccess ? state.success.currentAccount : null;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorSchemeSeed,
        automaticallyImplyLeading: true,
        shape: const RoundedRectangleBorder(borderRadius: kBottomBorderRadius),
        toolbarHeight: kToolBarHeight,
        actions: [
          const Gap(kThirdLevelGap),
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: kIconSizeLarge,
            ),
            onPressed: () => scaffoldKey.currentState!.openDrawer(),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
              size: kIconSizeMedium,
            ),
            onPressed: () {
              // AutoRouter.of(context).push(const NotificationSettingRoute());
            },
          ),
          AccountSelectionDropdown(
            accounts: ref.watch(accountListProvider),
            defaultAccount: account ?? const ('', ''),
            onChanged: (account) =>
                ref.read(accountProvider.notifier).changeAccount(account),
          ),
          const Gap(kThirdLevelGap),
        ],
      ),
      body: const ScreenTypeLayout(
        mobile: HomeMobileScreen(),
        tablet: HomeMobileScreen(),
        desktop: HomeMobileScreen(),
      ),
    );
  }
}
