import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/tokens/colors.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/profile_widgets/profile_bottom_bar.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/profile_widgets/rating_info_widget.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/profile_widgets/search_bar_widget.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/profile_widgets/store_info_widget.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/profile_widgets/store_items.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/category_item.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SellerProfileScreen extends StatefulWidget {
  const SellerProfileScreen({super.key});

  @override
  State<SellerProfileScreen> createState() => _SellerProfileScreenState();
}

class _SellerProfileScreenState extends State<SellerProfileScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBarWidget(),
        foregroundColor: kColorWhite,
        backgroundColor: kColorBlack50,
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: kColorBlack50,
              child: Column(
                children: [
                  StoreInfoWidget(),
                  GestureDetector(
                    onTap: () {
                      context.router.push(SellerInformation());
                    },
                    child: RatingInfoWidget(),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          const SliverToBoxAdapter(
            child: CategoryRow(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.78,
              child: StoreItems(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ProfileBottomBar(
        iconSize: 20,
        currentIndex: 2,
        onTap: (p0) {},
      ),
    );
  }
}
