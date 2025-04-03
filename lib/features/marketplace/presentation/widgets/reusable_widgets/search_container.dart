import 'package:gcpro_design_system/tokens/colors.dart';
import 'package:flutter/material.dart';

class SearchContainer extends StatelessWidget {
  final String hintText;
  final double heightMultiplier;
  final double widthMultiplier;
  final VoidCallback? onTap;
  // New color parameters with defaults from design system
  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;
  final Color hintTextColor;

  const SearchContainer({
    Key? key,
    this.hintText = 'Search...',
    this.heightMultiplier = 0.047,
    this.widthMultiplier = 0.8,
    this.onTap,
    this.backgroundColor = kColorWhite50,
    this.borderColor = kColorBlack50,
    this.iconColor = kColorSchemeSeed,
    this.hintTextColor =
        const Color(0x993C3C43), // kColorBlack50 with 0.6 opacity
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * heightMultiplier,
      width: MediaQuery.sizeOf(context).width * widthMultiplier,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: borderColor,
          width: 1.25,
        ),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(
              Icons.search,
              color: iconColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Text(
              hintText,
              style: TextStyle(
                color: hintTextColor,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
