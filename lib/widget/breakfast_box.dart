import 'package:flutter/material.dart';
import 'package:recipe/components/recipe_list.dart';
import 'package:recipe/model/food.dart';
import 'package:recipe/widget/planner_breakfast.dart';

class BreakfastBox extends StatefulWidget {
  final Food food;
  final Function(Food) onUpdate;
  const BreakfastBox({super.key, required this.food, required this.onUpdate});

  @override
  State<BreakfastBox> createState() => _BreakfastBoxState();
}

class _BreakfastBoxState extends State<BreakfastBox> {
  Food? breakfastFood;

  void remove(String type) {
    setState(() {
      if (type == 'breakfast') {
        breakfastFood = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return // Breakfast Box
        Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Breakfast",
            style: TextStyle(
              fontFamily: 'RajBold',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (breakfastFood == null) {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const PlannerBreakfast(isType: 'breakfast'),
                  ),
                );
                if (result != null && result is Food) {
                  setState(() {
                    breakfastFood = result;
                  });
                  widget.onUpdate(result);
                }
              }
            },
            child: Container(
              width: double.infinity,
              height: 260,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffffd166)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: breakfastFood != null
                  ? GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeList(food: breakfastFood!, recipeList: breakfastFood!.recipeList)));
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
                                image: AssetImage(breakfastFood!.image),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  breakfastFood!.name,
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
                                          breakfastFood!.rate,
                                          size: 16,
                                          color: const Color(0xffef476f),
                                        ),
                                        Text(
                                          breakfastFood!.rateText,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff26547c)),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          breakfastFood!.time,
                                          size: 15,
                                          color: const Color(0xff26547c),
                                        ),
                                        Text(
                                          breakfastFood!.timeText,
                                          style: const TextStyle(
                                              fontSize: 12,
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
                                    remove('breakfast');
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
