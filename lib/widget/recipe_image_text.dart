import 'package:flutter/material.dart';
import 'package:recipe/components/recipe_list.dart';
import 'package:recipe/model/food.dart';

class RecipeImageText extends StatefulWidget {
  // string is type of food
  final String isRecommended;
  const RecipeImageText({super.key, required this.isRecommended});

  @override
  State<RecipeImageText> createState() => _RecipeImageTextState();
}

class _RecipeImageTextState extends State<RecipeImageText> {
  @override
  Widget build(BuildContext context) {
    // declare of filter to be specific of Recommended of food
    List<Food> filteredFoods =
        foods.where((food) => food.recommended == widget.isRecommended).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            filteredFoods.length,
            (index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeList(food: filteredFoods[index], recipeList: filteredFoods[index].recipeList, ),
                        ),
                      );
                  },
                  child:
                      // imaage of recipe
                      Container(
                    width: 220,
                    margin: const EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(filteredFoods[index].image),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // name of recipe
                        Text(
                          filteredFoods[index].name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'RajBold'),
                        ),

                        // rate and minutes
                        Row(
                          children: [
                            Icon(
                              filteredFoods[index].rate,
                              color: const Color(0xffef476f),
                              size: 15,
                            ),
                            Text(
                              filteredFoods[index].rateText,
                              style: const TextStyle(color: Color(0xff6d676e), fontWeight: FontWeight.bold, fontSize: 12, fontFamily: 'RajSemi'),
                            ),
                            const SizedBox(width: 10),
                            Icon(
                              filteredFoods[index].time,
                              size: 14,
                              color: const Color(0xff26547c),
                            ),
                            Text(
                              filteredFoods[index].timeText,
                              style: const TextStyle(color: Color(0xff6d676e), fontWeight: FontWeight.bold, fontSize: 12, fontFamily: 'RajSemi'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
