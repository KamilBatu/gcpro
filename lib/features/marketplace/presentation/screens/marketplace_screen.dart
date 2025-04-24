import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/tokens/colors.dart';
import 'package:gcpro/features/marketplace/presentation/screens/marketplace_mobile_screen.dart';
import 'package:gcpro/shared/utils/responsive/screen_type_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class MarketPlaceScreen extends ConsumerWidget {
  const MarketPlaceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: MarketplaceMobileScreen(),
        tablet: MarketplaceMobileScreen(),
        desktop: MarketplaceMobileScreen(),
      ),
    );
  }
}
