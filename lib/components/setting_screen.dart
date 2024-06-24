import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipe/components/meal_planner.dart';
import 'package:recipe/components/wishlist.dart';


class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xfffffcf9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Setting',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, fontFamily: 'RajBold'
                  ),
                ),

                const SizedBox(height: 20,),

                Column(
                  children: [

                    // Meal Planner
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const MealPlanner()));
                        },
                        child: const Row(
                          children: [
                            Icon(Iconsax.calendar5, size: 39, color: Color(0xffef476f),),
                            SizedBox(width: 10,),
                            Text('Meal Planner', style: TextStyle(
                              fontFamily: 'RajBold', 
                              fontWeight: FontWeight.bold, 
                              fontSize: 30),)
                          ],
                        )
                      ),
                      const SizedBox(height: 10,),
                      // Language
                      GestureDetector(
                        onTap: () {
                          print('Click Language');
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.language, size: 39, color: Color(0xffef476f),),
                            SizedBox(width: 10,),
                            Text('Language', style: TextStyle(
                              fontFamily: 'RajBold', 
                              fontWeight: FontWeight.bold, 
                              fontSize: 30),)
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),

                      // Wishlist 
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Wishlist()));
                        },
                        child: const Row(
                          children: [
                            Icon(Iconsax.heart5, size: 39, color: Color(0xffef4776),),
                            SizedBox(width: 10,),
                            Text('Wishlist', style: TextStyle(
                              fontFamily: 'RajBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                            ),)
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),

                      // Share app
                      GestureDetector(
                        onTap: () {
                          print('Click Share app');
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.share, size: 39, color: Color(0xffef476f),),
                            SizedBox(width: 10,),
                            Text('Share app', style: TextStyle(
                              fontFamily: 'RajBold', 
                              fontWeight: FontWeight.bold, 
                              fontSize: 30),)
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      // rate app
                      GestureDetector(
                        onTap: () {
                          print('Click Rate app');
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.star_border_outlined, size: 39, color: Color(0xffef476f),),
                            SizedBox(width: 10,),
                            Text('Rate App', style: TextStyle(
                              fontFamily: 'RajBold', 
                              fontWeight: FontWeight.bold, 
                              fontSize: 30),)
                          ],
                        ),
                      ),
                  ],
                )

              ],
            ),
          ),
          )
      
      ),
    );
  }
}