import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color bgColor, fgColor;
  final String title;
  final double? fontSize;
  final VoidCallback onPressed;

  const CustomButton(
      {super.key,
      required this.bgColor,
      required this.fgColor,
      required this.title,
      required this.onPressed,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: fontSize),
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(width: 1, color: Colors.blue)),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
