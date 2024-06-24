import 'package:flutter/material.dart';
import 'package:recipe/widget/recipe_screen_appbar.dart';
import 'package:recipe/widget/recipe_screen_image.dart';



class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return   const Scaffold(
      backgroundColor: Color(0xfffffcf9),
      body: SafeArea(
        child:  Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                // Recipe Appbar
                RecipeAppbar(),

                SizedBox(height: 30,),
                
                // Recipe Image
                RecipeScreenImage()

              ],
            ),
          ),
        ),
      ),
    );
  }
}