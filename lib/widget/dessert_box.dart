import 'package:flutter/material.dart';
import 'package:recipe/components/recipe_list.dart';
import 'package:recipe/model/food.dart';
import 'package:recipe/widget/planner_dessert.dart';


class DessertBox extends StatefulWidget {
  final Food food;
  final Function(Food) onUpdate;
  const DessertBox({super.key,
    required this.food,
    required this.onUpdate
  });

  @override
  State<DessertBox> createState() => _DessertBoxState();
}

class _DessertBoxState extends State<DessertBox> {
  Food? dessertFood;


  void remove(String type) {
    setState(() {
      if (type == 'dessert') {
        dessertFood = null;
      } 
    });
  }
  @override
  Widget build(BuildContext context) {
    return // Dessert Box
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Dessert",
                        style: TextStyle(
                          fontFamily: 'RajBold',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (dessertFood == null) {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PlannerDessert(isType: 'dessert'),
                              ),
                            );
                            if (result != null && result is Food) {
                              setState(() {
                                dessertFood = result;
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
                          child: dessertFood != null
                              ? GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeList(food: dessertFood!, recipeList: dessertFood!.recipeList)));
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
                                            image: AssetImage(dessertFood!.image),
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
                                              dessertFood!.name,
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
                                                      dessertFood!.rate,
                                                      size: 16,
                                                      color: const Color(0xffef476f),
                                                    ),
                                                    Text(
                                                      dessertFood!.rateText,
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
                                                      dessertFood!.time,
                                                      size: 15,
                                                      color: const Color(0xff26547c),
                                                    ),
                                                    Text(
                                                      dessertFood!.timeText,
                                                      style: const TextStyle(fontSize: 12, color: Color(0xff26547c)),
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
                                                remove('dessert');
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