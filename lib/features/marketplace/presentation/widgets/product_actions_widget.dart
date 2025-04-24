import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/tokens/colors.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/actionbutton_iconsbutton.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'show_bottom_sheet_action.dart';
import '../../domain/entities/product_entity.dart';

class ProductActionsWidget extends StatefulWidget {
  const ProductActionsWidget({super.key, required this.product});
  final Product product;

  @override
  State<ProductActionsWidget> createState() => _ProductActionsWidgetState();
}

class _ProductActionsWidgetState extends State<ProductActionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorWhite,
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              context.router.navigate(const ChatRoute());
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  backgroundColor: kColorBlack25,
                  foregroundColor: kColorWhite,
                  minRadius: 15,
                  child: Icon(Icons.chat_rounded),
                ),
                Text(
                  'chat',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          buildActionButton(
              heightValue: 0.05,
              widthValue: 0.37,
              context: context,
              isOutlined: true,
              label: 'Add to cart',
              onPressed: () {
                showBottomSheets(
                  context: context,
                  product: widget.product,
                  isBuyNow: false,
                );
              }),
          buildActionButton(
              heightValue: 0.05,
              widthValue: 0.37,
              context: context,
              textColor: kColorWhite,
              label: 'Send inquiry',
              onPressed: () {}),
        ],
      ),
    );
  }
}
