
import 'package:flutter/material.dart';

class SingleNoteWidget extends StatelessWidget {
  final String? title;
  final String? body;
  final int? color;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  const SingleNoteWidget({Key? key, this.title, this.body, this.color, this.onTap, this.onLongPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(color!),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),),
            SizedBox(height: 5,),
            Text(body!, style: TextStyle(color: Colors.black, fontSize: 16),)
          ],
        ),
      ),
    );
  }
}
