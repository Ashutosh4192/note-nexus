import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  const CustomAlert(
      {super.key, required this.text, required this.voidCallback});
  final String text;
  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
      actions: [TextButton(onPressed: voidCallback, child: const Text("OK"))],
    );
  }
}
