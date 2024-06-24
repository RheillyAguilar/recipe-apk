import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/components/widget_bottom.dart';
import 'package:recipe/widget/box_date.dart';

class MealPlanner extends StatefulWidget {
  const MealPlanner({super.key});

  @override
  State<MealPlanner> createState() => _MealPlannerState();
}

class _MealPlannerState extends State<MealPlanner> {
  String currentDate = 'Monday';
  List<String> categories = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffcf9),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Column(
              children: [
                Stack(
                  children: [
                    // back button into home
                    Positioned(
                      top: 0,
                      left: 0,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  const WidgetBottom()));
                        },
                        style: IconButton.styleFrom(
                            backgroundColor: const Color(0xff26547c),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            fixedSize: const Size(40, 40)),
                        icon: const Icon(
                          CupertinoIcons.chevron_back,
                          color: Color(0xfffffcf9),
                        ),
                      ),
                    ),
                    // text meal planner
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Meal Planner',
                        style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'RajBold',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // categories per day
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      categories.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            currentDate = categories[index];
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: currentDate == categories[index]
                                ? const Color(0xffef476f)
                                : const Color(0xff06d6a0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Text(
                            categories[index],
                            style: const TextStyle(
                              color: Color(0xfffffcf9),
                              fontFamily: 'RajSemi',
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body:  BoxDate(),
    );
  }
}
