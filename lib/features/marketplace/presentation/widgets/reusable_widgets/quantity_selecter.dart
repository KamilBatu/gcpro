import 'package:gcpro_design_system/tokens/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuantitySelector extends StatelessWidget {
  final double? width;
  final double? height;
  final WidgetRef ref;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final TextEditingController controller;
  final StateProvider<int> numberProvider;
  final Color borderColor;
  final double borderRadius;
  final Color textColor;
  final double textSize;
  final double iconSize;
  final Color iconColor;
  final String dialogTitle;

  const QuantitySelector({
    super.key,
    this.width,
    this.height,
    required this.ref,
    required this.onAdd,
    required this.onRemove,
    required this.controller,
    required this.numberProvider,
    this.borderColor = kColorBlack25,
    this.borderRadius = 25,
    this.textColor = kColorBlack50,
    this.textSize = 14,
    this.iconSize = 18,
    this.iconColor = Colors.black,
    this.dialogTitle = 'Quantity',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Consumer(
        builder: (context, ref, child) {
          final quantity = ref.watch(numberProvider);

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (controller.text != quantity.toString()) {
              controller.text = quantity.toString();
            }
          });

          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: width ?? MediaQuery.sizeOf(context).width * 0.17,
                height: height ?? MediaQuery.sizeOf(context).height * 0.035,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildRemoveButton(),
                    _buildQuantityDisplay(context, quantity),
                    _buildAddButton(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildRemoveButton() {
    return GestureDetector(
      onTap: onRemove,
      child: Icon(
        Icons.remove,
        size: iconSize,
        color: iconColor,
      ),
    );
  }

  Widget _buildQuantityDisplay(BuildContext context, int quantity) {
    return GestureDetector(
      onTap: () => _showQuantityDialog(context),
      child: Text(
        quantity.toString(),
        style: TextStyle(
          fontSize: textSize,
          color: textColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: onAdd,
      child: Icon(
        Icons.add,
        size: iconSize,
        color: iconColor,
      ),
    );
  }

  void _showQuantityDialog(BuildContext context) {
    // ignore: inference_failure_on_function_invocation
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(dialogTitle),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Enter quantity',
            ),
            onSubmitted: (value) {
              _updateQuantity(value);
              Navigator.of(context).pop();
            },
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('OK'),
              onPressed: () {
                _updateQuantity(controller.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _updateQuantity(String value) {
    final intValue = int.tryParse(value) ?? 1;
    ref.read(numberProvider.notifier).state = intValue;
  }
}
