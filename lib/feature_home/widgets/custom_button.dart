import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  const Custombutton(
      {super.key, required this.voidCallback, required this.text});
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
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}
