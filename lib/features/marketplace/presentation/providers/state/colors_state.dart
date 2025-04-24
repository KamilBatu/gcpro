import 'dart:ui';

class ColorsState {
  final Color foregroundColor;
  final Color backgroundColor;
  final Color textColor;
  final Color linkColor;
  final Color hintColor;
  final Color searchFieldColor;
  final Color borderLineColor;
  final Color cartColor;
  final Color searchIconColor;
  final Color whiteblack;

  ColorsState({
    required this.foregroundColor,
    required this.backgroundColor,
    required this.textColor,
    required this.linkColor,
    required this.hintColor,
    required this.searchFieldColor,
    required this.borderLineColor,
    required this.cartColor,
    required this.searchIconColor,
    required this.whiteblack,
  });

  ColorsState copyWith({
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
  }) {
    return ColorsState(
      foregroundColor: foregroundColor ?? this.foregroundColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      linkColor: linkColor ?? this.linkColor,
      hintColor: hintColor ?? this.hintColor,
      searchFieldColor: searchFieldColor ?? this.searchFieldColor,
      borderLineColor: borderLineColor ?? this.borderLineColor,
      cartColor: cartColor ?? this.cartColor,
      searchIconColor: searchIconColor ?? this.searchIconColor,
      whiteblack: whiteblack ?? this.whiteblack,
    );
  }
}
