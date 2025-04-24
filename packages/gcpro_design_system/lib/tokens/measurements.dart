import 'colors.dart';
import 'package:flutter/material.dart';

enum WindowWidth {
  compact(600.0),
  medium(840.0),
  expanded(1200.0),
  large(1600.0);

  const WindowWidth(this.value);
  final double value;
}

const kButtonIconSizeSmall = 14.0;
const kButtonIconSizeMedium = 16.0;
const kButtonIconSizeLarge = 18.0;

const kIconSizeSmall = 16.0;
const kIconSizeMedium = 24.0;
const kIconSizeLarge = 32.0;

const kToolBarHeight = 80.0;

// Gaps
const kFirstLevelGap = 8.0;
const kSecondLevelGap = 16.0;
const kThirdLevelGap = 24.0;
const kFourthLevelGap = 32.0;
const kFifthLevelGap = 40.0;

const kBorderRadius4 = BorderRadius.all(Radius.circular(4));
const kBorderRadius6 = BorderRadius.all(Radius.circular(6));
const kBorderRadius8 = BorderRadius.all(Radius.circular(8));
final kBorderRadius10 = BorderRadius.circular(10);
const kBorderRadius12 = BorderRadius.all(Radius.circular(12));
const kBorderRadius20 = BorderRadius.all(Radius.circular(20));
const kBorderRadius25 = BorderRadius.all(Radius.circular(25));

const kBottomBorderRadius = BorderRadius.vertical(bottom: Radius.circular(35));
const kTopBorderRadius = BorderRadius.vertical(top: Radius.circular(35));

// Shadows
const kShadow1 = BoxShadow(
  color: Color.fromARGB(65, 0, 0, 0),
  blurRadius: 12,
  spreadRadius: 2,
  offset: Offset(0, 4),
);

const kShadow2 = BoxShadow(
  color: Color.fromARGB(70, 0, 0, 0),
  blurRadius: 8,
  spreadRadius: 2,
  offset: Offset(0, 4),
);

const kShadow3 = BoxShadow(
  color: Color.fromARGB(170, 0, 0, 0),
  blurRadius: 4,
  spreadRadius: 2,
  offset: Offset(0, 4),
);

const kP1 = EdgeInsets.all(1);
const kP4 = EdgeInsets.all(4);
const kP5 = EdgeInsets.all(5);
const kP6 = EdgeInsets.all(6);
const kP8 = EdgeInsets.all(8);
const kP10 = EdgeInsets.all(10);
const kP12 = EdgeInsets.all(12);
const kP16 = EdgeInsets.all(16);
const kP20 = EdgeInsets.all(20);
const kPs8 = EdgeInsets.only(left: 8);
const kPs2 = EdgeInsets.only(left: 2);
const kPe4 = EdgeInsets.only(right: 4);
const kPe8 = EdgeInsets.only(right: 8);
const kPh20v5 = EdgeInsets.symmetric(horizontal: 20, vertical: 5);
const kPh20v10 = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
const kPh20v15 = EdgeInsets.symmetric(horizontal: 20, vertical: 15);
const kPv2 = EdgeInsets.symmetric(vertical: 2);
const kPv6 = EdgeInsets.symmetric(vertical: 6);
const kPv8 = EdgeInsets.symmetric(vertical: 8);
const kPv10 = EdgeInsets.symmetric(vertical: 10);
const kPv20 = EdgeInsets.symmetric(vertical: 20);
const kPh2 = EdgeInsets.symmetric(horizontal: 2);
const kPt28o8 = EdgeInsets.only(top: 28, left: 8.0, right: 8.0, bottom: 8.0);
const kPt5o10 =
    EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 10.0);
const kPh4 = EdgeInsets.symmetric(horizontal: 4);
const kPh8 = EdgeInsets.symmetric(horizontal: 8);
const kPh12 = EdgeInsets.symmetric(horizontal: 12);
const kPh20 = EdgeInsets.symmetric(horizontal: 20);
const kPh24 = EdgeInsets.symmetric(horizontal: 24);
const kPh20t40 = EdgeInsets.only(
  left: 20,
  right: 20,
  top: 40,
);
const kPs0o6 = EdgeInsets.only(
  left: 0,
  top: 6,
  right: 6,
  bottom: 6,
);
const kPh60 = EdgeInsets.symmetric(horizontal: 60);
const kPh60v60 = EdgeInsets.symmetric(vertical: 60, horizontal: 60);
const kPh12v8 = EdgeInsets.symmetric(vertical: 12, horizontal: 8);
const kPt24l4 = EdgeInsets.only(
  top: 24,
  left: 4.0,
  //right: 4.0,
  // bottom: 8.0,
);
const kPt8l4 = EdgeInsets.only(
  top: 8.0,
  left: 4.0,
  //right: 4.0,
  // bottom: 8.0,
);
const kPt8 = EdgeInsets.only(top: 8);
const kPt20 = EdgeInsets.only(top: 20);
const kPt24 = EdgeInsets.only(top: 24);
const kPt28 = EdgeInsets.only(top: 28);
const kPt32 = EdgeInsets.only(top: 32);
const kPb10 = EdgeInsets.only(bottom: 10);
const kPb15 = EdgeInsets.only(bottom: 15);
const kPb70 = EdgeInsets.only(bottom: 70);
const kSizedBoxEmpty = SizedBox();
const kHSpacer2 = SizedBox(width: 2);
const kHSpacer4 = SizedBox(width: 4);
const kHSpacer5 = SizedBox(width: 5);
const kHSpacer6 = SizedBox(width: 6);
const kHSpacer8 = SizedBox(width: 8);
const kHSpacer10 = SizedBox(width: 10);
const kHSpacer12 = SizedBox(width: 12);
const kHSpacer20 = SizedBox(width: 20);
const kHSpacer40 = SizedBox(width: 40);
const kVSpacer3 = SizedBox(height: 3);
const kVSpacer5 = SizedBox(height: 5);
const kVSpacer6 = SizedBox(height: 6);
const kVSpacer8 = SizedBox(height: 8);
const kVSpacer10 = SizedBox(height: 10);
const kVSpacer16 = SizedBox(height: 16);
const kVSpacer20 = SizedBox(height: 20);
const kVSpacer40 = SizedBox(height: 40);

final kButtonSidebarStyle = ElevatedButton.styleFrom(padding: kPh12);

// IconTheme
const kIconTheme = IconThemeData(
  color: kColorSchemeSeed,
  size: kIconSizeSmall,
);
