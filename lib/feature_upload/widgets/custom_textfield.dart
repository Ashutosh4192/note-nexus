import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.text,
  });
  final TextEditingController controller;
  final String text;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width <= 600
          ? MediaQuery.of(context).size.width * 0.9
          : 600,
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
      ),
      child: TextFormField(
        maxLines: null,
        style: const TextStyle(
          color: Colors.black,
        ),
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.text,
          labelStyle: const TextStyle(color: Colors.black),
          contentPadding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 3.0),
            borderRadius: BorderRadius.circular(11),
          ),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(11)),
        ),
      ),
    );
  }
}
