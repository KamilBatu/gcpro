import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/features/home/presentation/widgets/action_card.dart';
import 'package:gcpro/features/home/presentation/widgets/best_seller_card.dart';
import 'package:gcpro/features/home/presentation/widgets/sales_chart.dart';
import 'package:gcpro/features/home/presentation/widgets/summary_detail.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeMobileScreen extends ConsumerWidget {
  const HomeMobileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: kP12,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const BestSellerCard(),
            const SalesChartCard(),
            const SummaryGrid(),
            BFilledButton(
              isLoading: false,
              text: AppLocalizations.of(context).explore_products,
              textColor: Colors.white,
              onPressed: () {},
            ),
            ActionCard(
              title: AppLocalizations.of(context).connect_with_suppliers,
              buttonText: AppLocalizations.of(context).check,
              onPressed: () {
                AutoRouter.of(context)
                    .innerRouterOf(DashboardRoute.name)
                    ?.navigate(const MarketPlaceRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
