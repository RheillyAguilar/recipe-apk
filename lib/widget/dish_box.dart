import 'package:flutter/material.dart';
import 'package:recipe/components/recipe_list.dart';
import 'package:recipe/model/food.dart';
import 'package:recipe/widget/planner_breakfast.dart';

class DishBox extends StatefulWidget {
  final Food food;
  final Function(Food) onUpdate;
  const DishBox({super.key,
    required this.food,
    required this.onUpdate
  });

  @override
  State<DishBox> createState() => _DishBoxState();
}

class _DishBoxState extends State<DishBox> {
    Food? dishFood;


  void remove(String type) {
    setState(() {
      if (type == 'dish') {
        dishFood = null;
      } 
    });
  }
  @override
  Widget build(BuildContext context) {
    return                 Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Dish",
                        style: TextStyle(
                          fontFamily: 'RajBold',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (dishFood == null) {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PlannerBreakfast(isType: 'dish'),
                              ),
                            );
                            if (result != null && result is Food) {
                              setState(() {
                                dishFood = result;
                              });
                              widget.onUpdate(result);
                            }
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 260,
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffffd166)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: dishFood != null
                              ? GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeList(food: dishFood!, recipeList: dishFood!.recipeList)));
                                },
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10)),
                                            image: DecorationImage(
                                              image: AssetImage(dishFood!.image),
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              dishFood!.name,
                                              style: const TextStyle(
                                                  fontFamily: 'RajSemi',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      dishFood!.rate,
                                                      size: 15,
                                                      color: const Color(0xffef476f),
                                                    ),
                                                    Text(
                                                      dishFood!.rateText,
                                                      style: const TextStyle(fontSize: 12, color: Color(0xff26547c)),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      dishFood!.time,
                                                      size: 15,
                                                      color: const Color(0xff26547c)
                                                    ),
                                                    Text(
                                                      dishFood!.timeText,
                                                      style: const TextStyle(fontSize: 12,
                                                      color: Color(0xff26547c)),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Container(
                                            width: double.infinity,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadiusDirectional.only(
                                                  bottomEnd: Radius.circular(10),
                                                  bottomStart: Radius.circular(10)),
                                              color: Colors.red,
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                remove('dish');
                                              },
                                              icon: const Icon(Icons.delete),
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                              )
                              : const Icon(
                                  Icons.add,
                                  size: 50,
                                  color: Color(0xff06d6a0),
                                ),
                        ),
                      ),
                    ],
                  ),
                );
  }
}