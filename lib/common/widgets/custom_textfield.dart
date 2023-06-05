import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;

  final String hintText;
  final int? maxLines;
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.maxLines = 1})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black26))),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.hintText;
        }
        return null;
      },
      maxLines: widget.maxLines,
    );
  }
}
