
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final List<Color> predefinedColors = [
  Color(0xffFD99FF),
  Color(0xffFF9E9E),
  Color(0xfffedc56),
  Color(0xfffca3b7),
  Color(0xff91F48F),
  Color(0xffB69CFF),
  Color(0xff9EFFFF),
];

void toast({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
      fontSize: 16.0);
}