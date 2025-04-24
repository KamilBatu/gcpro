import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:flutter/material.dart';

class ProgressItem extends StatelessWidget {
  final String label;
  final int value;
  final double maxValue;
  final Color backgroundColor;
  final Color progressColor;

  const ProgressItem({
    Key? key,
    required this.label,
    required this.value,
    required this.maxValue,
    required this.backgroundColor,
    required this.progressColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: kColorBlack50),
            ),
            Text(
              value.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: kColorBlack50),
            ),
          ],
        ),
        LinearProgressIndicator(
          value: value / maxValue,
          backgroundColor: backgroundColor,
          color: progressColor,
        ),
      ],
    );
  }
}

// star rating
class StarRating extends StatelessWidget {
  final double rating; // Rating value (e.g., 3.5 out of 5)
  final double starSize; // Size of each star
  final Color filledColor; // Color of filled stars
  final Color emptyColor; // Color of empty stars
  final int maxStars; // Total number of stars (default 5)
  final double spacing; // Space between stars

  const StarRating({
    Key? key,
    required this.rating,
    this.starSize = 20.0,
    this.filledColor = Colors.yellow,
    this.emptyColor = kColorBlack50,
    this.maxStars = 5,
    this.spacing = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxStars, (index) {
        return Padding(
          padding: EdgeInsets.only(right: index < maxStars - 1 ? spacing : 0),
          child: _buildStar(context, index),
        );
      }),
    );
  }

  Widget _buildStar(BuildContext context, int index) {
    IconData iconData;
    Color color;

    if (index >= rating) {
      // Empty star
      iconData = Icons.star_border;
      color = emptyColor;
    } else if (index < rating && index + 1 > rating) {
      // Half star
      iconData = Icons.star_half;
      color = filledColor;
    } else {
      // Full star
      iconData = Icons.star;
      color = filledColor;
    }

    return Icon(
      iconData,
      size: starSize,
      color: color,
    );
  }
}
