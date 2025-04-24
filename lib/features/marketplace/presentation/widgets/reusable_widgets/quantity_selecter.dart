import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final double? width;
  final double? height;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  // ignore: inference_failure_on_function_return_type
  final Function(int) onQuantityChanged;
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
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
    required this.onQuantityChanged,
    this.borderColor = Colors.black26,
    this.borderRadius = 25,
    this.textColor = Colors.black54,
    this.textSize = 14,
    this.iconSize = 18,
    this.iconColor = Colors.black,
    this.dialogTitle = 'Quantity',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Row(
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
                _buildQuantityDisplay(context),
                _buildAddButton(),
              ],
            ),
          ),
        ],
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

  Widget _buildQuantityDisplay(BuildContext context) {
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
    final controller = TextEditingController(text: quantity.toString());

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
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('OK'),
              onPressed: () {
                final newQuantity = int.tryParse(controller.text) ?? quantity;
                if (newQuantity >= 0) {
                  onQuantityChanged(newQuantity);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
