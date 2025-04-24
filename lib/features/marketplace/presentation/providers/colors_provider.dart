import 'dart:ui';
import 'package:gcpro_design_system/tokens/colors.dart';
import 'package:gcpro/features/marketplace/presentation/providers/state/colors_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define delay function if not already defined
Future<void> delay({required int microSecond}) async {
  await Future.delayed(Duration(microseconds: microSecond));
}

class ColorsNotifier extends StateNotifier<ColorsState> {
  ColorsNotifier()
      : super(
          ColorsState(
            foregroundColor: kColorWhite,
            backgroundColor: kColorSchemeSeed,
            textColor: kColorWhite,
            linkColor: Colors.yellowAccent,
            hintColor: kColorBlack,
            searchFieldColor: kColorWhite,
            borderLineColor: Colors.grey.shade300,
            cartColor: kColorWhite,
            searchIconColor: kColorBlack,
            whiteblack: kColorWhite,
          ),
        );

  Future<void> changeColors({
    Color? foregroundColor,
    Color? backgroundColor,
    Color? textColor,
    Color? linkColor,
    Color? hintColor,
    Color? searchFieldColor,
    Color? borderLineColor,
    Color? cartColor,
    Color? searchIconColor,
    Color? whiteblack,
  }) async {
    await delay(microSecond: 1);
    state = state.copyWith(
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      textColor: textColor,
      linkColor: linkColor,
      hintColor: hintColor,
      searchFieldColor: searchFieldColor,
      borderLineColor: borderLineColor,
      cartColor: cartColor,
      searchIconColor: searchIconColor,
      whiteblack: whiteblack,
    );
  }

  void resetColors() {
    state = ColorsState(
      foregroundColor: kColorWhite,
      backgroundColor: kColorSchemeSeed,
      textColor: kColorWhite,
      linkColor: Colors.yellowAccent,
      hintColor: kColorBlack,
      searchFieldColor: kColorWhite,
      borderLineColor: Colors.grey.shade300,
      cartColor: kColorWhite,
      searchIconColor: kColorBlack,
      whiteblack: kColorWhite,
    );
  }
}

final colorsProvider = StateNotifierProvider<ColorsNotifier, ColorsState>(
    (ref) => ColorsNotifier());
