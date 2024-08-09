import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.text,
    required this.iconData,
    required this.toHide,
  });
  final TextEditingController controller;
  final bool toHide;
  final String text;
  final IconData iconData;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.toHide,
        decoration: InputDecoration(
          hintText: widget.text,
          suffixIcon: Icon(widget.iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
      ),
    );
  }
}
