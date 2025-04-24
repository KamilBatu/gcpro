import 'package:gcpro_design_system/tokens/colors.dart';
import 'package:gcpro/features/marketplace/presentation/providers/marketplace_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget buildActionButton({
  required String label,
  required VoidCallback onPressed,
  bool isOutlined = false,
  Color? fillColor,
  Color? borderColor,
  Color? textColor,
  BuildContext? context,
  double? widthValue = 0.3,
  double? heightValue = 0.04,
}) {
  return SizedBox(
    width: MediaQuery.sizeOf(context!).width * widthValue!,
    height: MediaQuery.sizeOf(context!).height * heightValue!,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isOutlined ? Colors.transparent : fillColor ?? kColorSchemeSeed,
        foregroundColor: isOutlined
            ? (textColor ?? kColorSchemeSeed)
            : (textColor ?? kColorWhite),
        elevation: isOutlined ? 0 : 3,
        side: isOutlined
            ? BorderSide(color: borderColor ?? kColorBlack50)
            : BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context!)
            .textTheme
            .displaySmall
            ?.copyWith(fontWeight: FontWeight.bold, color: textColor),
      ),
    ),
  );
}

Widget buildCircleAvatar({
  double radius = 15.0,
  required IconData icon,
  Color iconColor = kColorWhite,
  double iconSize = 20.0,
  Color? backgroundColor = kColorSchemeSeed,
}) {
  return CircleAvatar(
    radius: radius,
    backgroundColor: backgroundColor,
    child: Icon(
      icon,
      color: iconColor,
      size: iconSize,
    ),
  );
}

BoxDecoration buildContainerDecoration({
  Color backgroundColor = Colors.white,
  double borderRadius = 7.0,
  Color borderColor = Colors.transparent,
  double borderWidth = 0.0,
  BoxShadow? boxShadow,
  Gradient? gradient,
  double? blurRadius = 0,
  double? spreadRadius = 0,
  double? offsetY = -10,
  double? offsetX = 0,
  Color? boxColor = kColorBlack25,
}) {
  return BoxDecoration(
    color: gradient == null ? backgroundColor : null,
    gradient: gradient,
    borderRadius: BorderRadius.circular(borderRadius),
    border: Border.all(
      color: borderColor,
      width: borderWidth,
    ),
    boxShadow: boxShadow != null
        ? [boxShadow]
        : [
            BoxShadow(
              color: boxColor!,
              spreadRadius: spreadRadius!,
              blurRadius: blurRadius!,
              offset: Offset(offsetX!, offsetY!),
            ),
          ],
  );
}

// Error Widget with Retry
class ErrorWidgetWithRetry extends StatelessWidget {
  final Object error;
  final WidgetRef ref;

  const ErrorWidgetWithRetry(
      {super.key, required this.error, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Something went wrong: $error'),
          ElevatedButton(
            onPressed: () => ref.refresh(allProductsProvider),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
