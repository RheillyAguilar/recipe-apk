
import 'package:flutter/material.dart';
import 'package:recipe/components/recipe_list.dart';
import 'package:recipe/model/food.dart';
class DishCategory extends StatefulWidget {
  final Food? food;
  final String isType;
  
  const DishCategory({super.key, required this.isType, this.food});

  @override
  State<DishCategory> createState() => _DishCategoryState();
}

class _DishCategoryState extends State<DishCategory> {
  @override
  Widget build(BuildContext context) {
    List<Food> filteredFoods =
        foods.where((food) => food.type == widget.isType).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dish',
        style: TextStyle(
          fontFamily: "RajSemo",
          fontSize: 30,
          color: Color(0xffef476f),
          fontWeight: FontWeight.bold),),
        backgroundColor: const Color(0xfffffcf9),
      ),
      backgroundColor: const Color(0xfffffcf9),
      body: ListView.builder(
        itemCount: filteredFoods.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeList(food: filteredFoods[index], recipeList: filteredFoods[index].recipeList)));
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffffd166)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // image of recipe
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          filteredFoods[index].image,
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // name of recipe
                          Text(
                            filteredFoods[index].name,
                            style: const TextStyle(
                              fontFamily: 'RajBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Row(
                            children: [
                              // row for cal icon and text
                              Row(
                                children: [
                                  Icon(
                                    filteredFoods[index].rate,
                                    size: 15,
                                    color: const Color(0xffef476f),
                                  ),
                                  Text(
                                    filteredFoods[index].rateText,
                                    style: const TextStyle(
                                      fontFamily: 'RajSemi',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff26547c),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                              // row for time icon and text
                              Row(
                                children: [
                                  Icon(
                                    filteredFoods[index].time,
                                    size: 14,
                                    color: const Color(0xff26547c),
                                  ),
                                  Text(
                                    filteredFoods[index].timeText,
                                    style: const TextStyle(
                                      color: Color(0xff26547c),
                                      fontFamily: 'RajSemi',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
