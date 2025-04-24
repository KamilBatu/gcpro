import 'package:gcpro/shared/globals.dart';
import 'package:flutter/widgets.dart';

class SizingInformation {
  SizingInformation({
    this.orientation,
    this.deviceType,
    this.screenSize,
    this.localWidgetSize,
  });
  final Orientation? orientation;
  final ScreenType? deviceType;
  final Size? screenSize;
  final Size? localWidgetSize;

  @override
  String toString() {
    // string representation of the object
    // ignore: lines_longer_than_80_chars
    return 'Orientation:$orientation DeviceType:$deviceType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}
