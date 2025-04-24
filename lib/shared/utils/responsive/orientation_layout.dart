import 'package:gcpro/shared/utils/responsive/base_widget.dart';
import 'package:flutter/material.dart';

class OreintationLayout extends StatelessWidget {
  const OreintationLayout({required this.portrait, super.key, this.landscape});
  // Mobile will be returned by default
  final Widget portrait;
  final Widget? landscape;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // If sizing indicates portrait and we have a tablet widget then return
        if (sizingInformation.orientation == Orientation.landscape) {
          if (landscape != null) {
            return landscape ?? portrait;
          }
        }

        // Return portrait layout if nothing else is supplied
        return portrait;
      },
    );
  }
}
