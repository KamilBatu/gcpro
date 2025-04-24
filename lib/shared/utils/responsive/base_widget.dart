import 'package:gcpro/shared/globals.dart';
import 'package:gcpro/shared/utils/responsive/sizing_info.dart';
import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({required this.builder, super.key});
  final Widget Function(
    BuildContext context,
    SizingInformation sizingInformation,
  ) builder;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (context, boxSizing) {
        final sizingInformation = SizingInformation(
          orientation: mediaQuery.orientation,
          deviceType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(boxSizing.maxWidth, boxSizing.maxHeight),
        );

        return builder(context, sizingInformation);
      },
    );
  }

  ScreenType getDeviceType(MediaQueryData mediaQuery) {
    final orientation = mediaQuery.orientation;

    final deviceWidth = orientation == Orientation.landscape
        ? mediaQuery.size.height
        : mediaQuery.size.width;

    if (deviceWidth > 950) return ScreenType.Desktop;

    if (deviceWidth > 600) return ScreenType.Tablet;

    return ScreenType.Mobile;
  }
}
