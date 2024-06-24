import 'package:flutter/material.dart';
import 'package:recipe/components/recipe_list.dart';
import 'package:recipe/model/food.dart';

class RecipeScreenImage extends StatefulWidget {
  const RecipeScreenImage({super.key});

    @override
  State<RecipeScreenImage> createState() => _RecipeScreenImageState();
}

class _RecipeScreenImageState extends State<RecipeScreenImage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
      itemBuilder: (context, index) => SingleChildScrollView(
        
        // Gesture detector when click the image
          child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeList(food: foods[index], recipeList: foods[index].recipeList, ) ));
        },
        child: SingleChildScrollView(
          
          child: Container(
            width: 220,
            margin: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(foods[index].image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // name of recipe
                Text(
                  foods[index].name,
                  style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'RajBold'),
                ),
                // rate and minutes
                Row(
                  children: [
                    Icon(
                      foods[index].rate,
                      color: const Color(0xffef476f),
                      size: 15,
                    ),
                    Text(
                      foods[index].rateText,
                      style: const TextStyle(color: Color(0xff6d676e), fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'RajSemi'),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      foods[index].time,
                      size: 14,
                      color: const Color(0xff26547c),
                    ),
                    Text(
                      foods[index].timeText,
                      style: const TextStyle(color: Color(0xff6d676e), fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'RajSemi'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
      itemCount: foods.length,
    );
  }
}
