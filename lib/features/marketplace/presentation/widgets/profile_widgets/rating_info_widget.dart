import 'package:gcpro_design_system/tokens/colors.dart';
import 'package:flutter/material.dart';

class RatingInfoWidget extends StatelessWidget {
  const RatingInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      width: MediaQuery.sizeOf(context).width * 0.95,
      height: MediaQuery.sizeOf(context).height * 0.072,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kColorBlack25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TitleSubtitle(
              title: '4.8',
              subtitle: 'store Rating',
            ),
          ),
          Expanded(
            child: TitleSubtitle(
              title: '4.2',
              subtitle: 'communication',
            ),
          ),
          Expanded(
            child: TitleSubtitle(
              title: '89%',
              subtitle: 'positive review',
            ),
          ),
          const Expanded(
            child: Icon(
              Icons.keyboard_arrow_right_outlined,
              color: kColorWhite,
            ),
          ),
        ],
      ),
    );
  }
}

class TitleSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleSubtitle({
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: kColorWhite,
              ),
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: kColorWhite,
                fontSize: 8,
              ),
        ),
      ],
    );
  }
}
