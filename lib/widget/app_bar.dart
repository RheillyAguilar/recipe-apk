import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Our Favorite\nFamily Recipe",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        fontFamily: 'RajBold',
      ),
    );
  }
}