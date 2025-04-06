import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  TextFieldWidget(this.controller);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          label: Text('0'),
          enabled: false,
          fillColor: Colors.grey,
          filled: true,
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }
}
