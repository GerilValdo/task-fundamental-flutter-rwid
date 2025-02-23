import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final int? maxLine;
  final TextInputAction? inputAction;

  const CustomTextForm({
    super.key,
    required this.title,
    this.maxLine,
    this.controller,
    this.inputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: inputAction,
      controller: controller,
      maxLines: maxLine,
      decoration: InputDecoration(
        label: Text(title),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
