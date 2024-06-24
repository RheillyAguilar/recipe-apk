import 'package:flutter/material.dart';
import 'package:recipe/components/recipe_list.dart';
import 'package:recipe/model/food.dart';
import 'package:recipe/widget/planner_snack.dart';


class SnackBox extends StatefulWidget {
  final Food food;
  final Function(Food) onUpdate;
  const SnackBox({super.key,
    required this.food,
    required this.onUpdate
  });

  @override
  State<SnackBox> createState() => _SnackBoxState();
}

class _SnackBoxState extends State<SnackBox> {
  Food? snackFood;


  void remove(String type) {
    setState(() {
      if (type == 'snack') {
        snackFood = null;
      } 
    });
  }
  @override
  Widget build(BuildContext context) {
    return // snack Box
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Snack",
                        style: TextStyle(
                          fontFamily: 'RajBold',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (snackFood == null) {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PlannerSnack(isType: 'snack'),
                              ),
                            );
                            if (result != null && result is Food) {
                              setState(() {
                                snackFood = result;
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
                          child: snackFood != null
                              ? GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeList(food: snackFood!, recipeList: snackFood!.recipeList)));
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
                                            image: AssetImage(snackFood!.image),
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
                                              snackFood!.name,
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
                                                      snackFood!.rate,
                                                      size: 16,
                                                      color: const Color(0xffef476f),
                                                    ),
                                                    Text(
                                                      snackFood!.rateText,
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
                                                      snackFood!.time,
                                                      size: 15,
                                                      color: const Color(0xff26547c),
                                                    ),
                                                    Text(
                                                      snackFood!.timeText,
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
                                                remove('snack');
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