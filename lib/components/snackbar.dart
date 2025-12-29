import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: const Color.fromARGB(
          205, 117, 255, 122),
      content: Text(
        content,
        style: const TextStyle(
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
