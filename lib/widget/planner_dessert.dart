import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/components/meal_planner.dart';

import 'package:recipe/model/food.dart';
//import 'package:recipe/widget/home_search_bar.dart';

class PlannerDessert extends StatefulWidget {
  final Food? food;
  final String isType;
  
  const PlannerDessert({super.key, required this.isType, this.food});

  @override
  State<PlannerDessert> createState() => _PlannerDessertState();
}

class _PlannerDessertState extends State<PlannerDessert> {
  @override
  Widget build(BuildContext context) {
    List<Food> filteredFoods =
        foods.where((food) => food.type == widget.isType).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffffcf9),
        toolbarHeight: 130,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MealPlanner(),
                        ),
                      );
                    },
                    icon: const Icon(
                      CupertinoIcons.chevron_back,
                      color: Color(0xfffffcf9),
                    ),
                    style: IconButton.styleFrom(
                        backgroundColor: const Color(0xff26547c)),
                  ),
                ),
                const SizedBox(height: 20),
                //const Expanded(child: MyHomeSearchBar())
              ],
            ),
          ),
        ),
      ),
            backgroundColor: const Color(0xfffffcf9),
      body: ListView.builder(
        itemCount: filteredFoods.length,
        itemBuilder: (context, index) {
          return Padding(
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
                    // icon for add to meal planner
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context, filteredFoods[index]);
                      },
                      icon: const Icon(Icons.add),
                      color: const Color(0xfffffcf9),
                      style: IconButton.styleFrom(
                        backgroundColor: const Color(0xffef476f),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
