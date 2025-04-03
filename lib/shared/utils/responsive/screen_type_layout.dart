import 'package:gcpro/shared/globals.dart';
import 'package:gcpro/shared/utils/responsive/base_widget.dart';
import 'package:flutter/material.dart';

class ScreenTypeLayout extends StatelessWidget {
  const ScreenTypeLayout({
    required this.mobile,
    super.key,
    this.tablet,
    this.desktop,
  });
  // Mobile will be returned by default
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // If we're on desktop, and a desktop widget is supplied then display
        if (sizingInformation.deviceType == ScreenType.Desktop) {
          if (desktop != null) {
            return desktop ?? mobile;
          }
        }

        // If sizing indicates Tablet and we have a tablet widget then return
        if (sizingInformation.deviceType == ScreenType.Tablet) {
          if (tablet != null) {
            return tablet ?? mobile;
          }
        }

        // Return mobile layout if nothing else is supplied
        return mobile;
      },
    );
  }
}
