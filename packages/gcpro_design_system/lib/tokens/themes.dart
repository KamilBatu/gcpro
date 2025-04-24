import 'measurements.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'typography.dart';

final kLightMaterialAppTheme = ThemeData(
  fontFamily: kFontFamily,
  fontFamilyFallback: kFontFamilyFallback,
  useMaterial3: true,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: kLightTextTheme,
  iconTheme: kIconTheme,
  colorScheme: ColorScheme.fromSeed(
    seedColor: kColorSchemeSeed,
    brightness: Brightness.light,
    dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
  ),
);

final kDarkMaterialAppTheme = ThemeData(
  fontFamily: kFontFamily,
  fontFamilyFallback: kFontFamilyFallback,
  useMaterial3: true,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: kDarkTextTheme,
  iconTheme: kIconTheme,
  colorScheme: ColorScheme.fromSeed(
    seedColor: kColorSchemeSeed,
    brightness: Brightness.dark,
    dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
  ),
);

final kLightTextTheme = TextTheme(
  titleLarge: kTextStyleTitleLarge.copyWith(color: kColorSchemeSeed),
  titleMedium: kTextStyleTitleMedium.copyWith(color: kColorBlack),
  titleSmall: kTextStyleTitleSmall.copyWith(color: kColorBlack),
  bodyLarge: kTextStyleBodyLarge.copyWith(color: kColorBlack),
  bodyMedium: kTextStyleBodyMedium.copyWith(color: kColorBlack),
  bodySmall: kTextStyleBodySmall.copyWith(color: kColorBlack),
  labelLarge: kTextStyleLabelLarge.copyWith(color: kColorBlack),
  labelMedium: kTextStyleLabelMedium.copyWith(color: kColorBlack),
  labelSmall: kTextStyleLabelSmall.copyWith(color: kColorBlack),
  headlineLarge: kTextStyleHeadlineLarge.copyWith(color: kColorBlack),
  headlineMedium: kTextStyleHeadlineMedium.copyWith(color: kColorBlack),
  headlineSmall: kTextStyleHeadlineSmall.copyWith(color: kColorBlack),
  displayLarge: kTextStyleDisplayLarge.copyWith(color: kColorBlack),
  displayMedium: kTextStyleDisplayMedium.copyWith(color: kColorBlack),
  displaySmall: kTextStyleDisplaySmall.copyWith(color: kColorBlack),
);

final kDarkTextTheme = TextTheme(
  titleLarge: kTextStyleTitleLarge.copyWith(color: kColorSchemeSeed),
  titleMedium: kTextStyleTitleMedium.copyWith(color: kColorWhite),
  titleSmall: kTextStyleTitleSmall.copyWith(color: kColorWhite),
  bodyLarge: kTextStyleBodyLarge.copyWith(color: kColorWhite),
  bodyMedium: kTextStyleBodyMedium.copyWith(color: kColorWhite),
  bodySmall: kTextStyleBodySmall.copyWith(color: kColorWhite),
  labelLarge: kTextStyleLabelLarge.copyWith(color: kColorWhite),
  labelMedium: kTextStyleLabelMedium.copyWith(color: kColorWhite),
  labelSmall: kTextStyleLabelSmall.copyWith(color: kColorWhite),
  headlineLarge: kTextStyleHeadlineLarge.copyWith(color: kColorWhite),
  headlineMedium: kTextStyleHeadlineMedium.copyWith(color: kColorWhite),
  headlineSmall: kTextStyleHeadlineSmall.copyWith(color: kColorWhite),
  displayLarge: kTextStyleDisplayLarge.copyWith(color: kColorWhite),
  displayMedium: kTextStyleDisplayMedium.copyWith(color: kColorWhite),
  displaySmall: kTextStyleDisplaySmall.copyWith(color: kColorWhite),
);
