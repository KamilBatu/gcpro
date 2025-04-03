import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_sysytem.dart';
import 'package:gcpro/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:gcpro/features/home/presentation/providers/home_provider.dart';
import 'package:gcpro/features/home/presentation/providers/state/account_state.dart';
import 'package:gcpro/features/home/presentation/widgets/action_card.dart';
import 'package:gcpro/features/home/presentation/widgets/best_seller_card.dart';
import 'package:gcpro/features/home/presentation/widgets/sales_chart.dart';
import 'package:gcpro/features/home/presentation/widgets/summary_detail.dart';
import 'package:gcpro/routes/app_route.gr.dart';
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
    final bestSellers = ref.watch(summaryDistribution);
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
          AccountSelectionDropdown(
            accounts: ref.watch(accountListProvider),
            defaultAccount: account ?? const ('', ''),
            onChanged: (account) =>
                ref.read(accountProvider.notifier).changeAccount(account),
          ),
          const Gap(kThirdLevelGap),
        ],
      ),
      body: Padding(
        padding: kP12,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const BestSellerCard(),
              const SalesChartCard(),
              SummaryGrid(summaryItems: bestSellers),
              BFilledButton(
                isLoading: false,
                text: "Explore Products",
                textColor: Colors.white,
                onPressed: () {},
              ),
              ActionCard(
                title: "Connect with Suppliers",
                buttonText: "Check",
                onPressed: () {
                  AutoRouter.of(context)
                      .innerRouterOf(DashboardRoute.name)
                      ?.navigate(const MarketPlaceRoute());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
