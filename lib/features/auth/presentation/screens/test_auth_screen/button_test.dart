import 'package:flutter/material.dart';

class ButtonTest extends StatelessWidget {
  final int number;
  final TextEditingController controller;

  ButtonTest(this.number, {required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          String currentText = controller.text;
          controller.text = currentText + number.toString();
        },
        child: Text('${number}', style: TextStyle(fontSize: 28)),
      ),
    );
  }
}
