import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/search_container.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/show_search_delegate.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () =>
            showSearch(context: context, delegate: CustomSearchDelegate()),
        child: SearchContainer(
          hintText: 'Search in this stores...',
          heightMultiplier: 0.047,
          widthMultiplier: 0.7,
          onTap: () {},
          backgroundColor: kColorWhite,
          borderColor: kColorWhite,
          iconColor: kColorBlack,
        ),
      ),
    );
  }
}
