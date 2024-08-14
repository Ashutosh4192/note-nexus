import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_loading_button/progress_loading_button.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.text,
    required this.voidCallback,
  });
  final VoidCallback voidCallback;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width <= 600
            ? MediaQuery.of(context).size.width
            : 600,
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
        child: ElevatedButton(
            onPressed: () {
                voidCallback();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              text,
              style:
              const TextStyle(fontSize: 22, color: Colors.white),
            ),),);
  }
}
