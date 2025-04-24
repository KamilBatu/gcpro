import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/features/marketplace/presentation/providers/toggle_provider.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/custom_table_row.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/eleveted_icon_button.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/progress_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SellerInformation extends ConsumerWidget {
  const SellerInformation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black54,
        title: Text(
          'Seller Information',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: SingleChildScrollView(
            child: Column(
          children: [
            _buildProfileSection(context, ref),
            const SizedBox(height: 7),
            _buildCredibilitySection(context),
            const SizedBox(height: 7),
            _buildCustomerReviewSection(context),
            const SizedBox(height: 7),
            ...List.generate(
              10,
              (index) => Container(
                padding: EdgeInsets.only(top: 7),
                child: _buildCommentSection(context),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context, WidgetRef ref) {
    final toggle = ref.watch(toggleNotifierProvider);
    return Container(
      height: 200,
      color: Colors.white,
      child: ClipRect(
        child: Stack(
          children: [
            Container(height: 40, color: Colors.black54),
            const Positioned(
              top: 7,
              left: 30,
              child: CircleAvatar(
                radius: 35,
                child: Icon(Icons.abc, size: 35),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: ListTile(
                title: const Text('wholesale'),
                subtitle: const Text('1.1k followers'),
                trailing: CustomElevatedIconButton(
                  label: toggle ? 'Follow' : 'unFollow',
                  icon: toggle ? Icons.add : Icons.arrow_left,
                  backgroundColor: toggle ? kColorSchemeSeed : kColorWhite50,
                  foregroundColor: toggle ? kColorWhite : kColorBlack,
                  onPressed: () {
                    ref.read(toggleNotifierProvider.notifier).toggle();
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 16,
              child: Text(
                'From Apr 29, 2024',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.black54),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 16,
              child: Text(
                'Business License',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: kColorSchemeSeed),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCredibilitySection(BuildContext context) => Container(
        height: 160,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Store Credibility',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              trailing: const Text('Details'),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '4.8',
                          style: TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Store rating',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: kColorBlack50),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.1),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Table(
                        columnWidths: const {
                          1: FixedColumnWidth(75),
                        },
                        children: [
                          CustomTableRow(
                              context: context,
                              ratingValue: '3.9',
                              label: 'items as descprition'),
                          CustomTableRow(
                              context: context,
                              ratingValue: '4.9',
                              label: 'Communication'),
                          CustomTableRow(
                              context: context,
                              ratingValue: '4.4',
                              label: 'items as descprition'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildCustomerReviewSection(BuildContext context) => Container(
        height: 160,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Customer reviews(2900)',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '90.2%',
                          style: TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'positive review',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: kColorBlack50),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          ProgressItem(
                            label: 'Postive',
                            value: 1900,
                            maxValue: 3000,
                            backgroundColor: kColorBlack25,
                            progressColor: kColorSchemeSeed,
                          ),
                          SizedBox(height: 7),
                          ProgressItem(
                            label: 'Neutral',
                            value: 900,
                            maxValue: 3000,
                            backgroundColor: kColorBlack25,
                            progressColor: kColorSchemeSeed,
                          ),
                          SizedBox(height: 7),
                          ProgressItem(
                            label: 'negative',
                            value: 400,
                            maxValue: 3000,
                            backgroundColor: kColorBlack25,
                            progressColor: kColorSchemeSeed,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildCommentSection(BuildContext context) => Container(
        width: MediaQuery.sizeOf(context).width * 1,
        padding: EdgeInsets.all(5),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 15),
                child: StarRating(rating: 3.5)),
            ListTile(
              title: Text('nameOfrevier'),
              subtitle: Text(
                'subtitle',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: kColorBlack50),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'here we show comments of the reviewers',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: kColorBlack),
              ),
            )
          ],
        ),
      );
}
