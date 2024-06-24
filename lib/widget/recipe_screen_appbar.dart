import 'package:flutter/material.dart';

class RecipeAppbar extends StatefulWidget {
  const RecipeAppbar({super.key});

  @override
  State<RecipeAppbar> createState() => _RecipeAppbarState();
}

class _RecipeAppbarState extends State<RecipeAppbar> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      "Collection",
      style: TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'RajBold'),
    );
  }
}
