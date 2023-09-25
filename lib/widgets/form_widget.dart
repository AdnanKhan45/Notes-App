
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final double? fontSize;
  final int? maxLines;
  final TextEditingController controller;
  final String hintText;
  const FormWidget({Key? key, this.fontSize, this.maxLines, required this.controller, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      style: TextStyle(fontSize: fontSize),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
      ),
    );
  }
}
