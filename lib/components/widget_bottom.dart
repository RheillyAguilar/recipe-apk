import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipe/components/home_screen.dart';
import 'package:recipe/components/recipe_screen.dart';
import 'package:recipe/components/setting_screen.dart';

class WidgetBottom extends StatefulWidget {
  const WidgetBottom({super.key});

  @override
  State<WidgetBottom> createState() => _WidgetBottomState();
}

class _WidgetBottomState extends State<WidgetBottom> {
  // current index for changing color of icon
  int currentIndex = 0;

  // data of each icon
  List screen = const [
    HomeScreen(),
    RecipeScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: const Color(0xfffffcf9),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,            
            children: [
              // Home Icon
              GestureDetector(
                onTap: () => {
                  setState(() {
                    currentIndex = 0;
                  })
                },
                child: Column(
                  children: [
                    Icon(
                      currentIndex == 0 ? Iconsax.home5 : Iconsax.home,
                      color: currentIndex == 0
                          ? const Color(0xff06d6a0)
                          : const Color(0xff06d6a0),
                      size: 30,
                    ),
                    const Text(
                      'Home',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'RajBold'),
                    )
                  ],
                ),
              ),

              // recipe Icon
              GestureDetector(
                onTap: () => {
                  setState(() {
                    currentIndex = 1;
                  })
                },
                child: Column(
                  children: [
                    Icon(
                      currentIndex == 1 ?  CupertinoIcons.book_solid : CupertinoIcons.book,
                      color: currentIndex == 1
                          ? const Color(0xffef476f)
                          : const Color(0xff06d6a0),
                      size: 30,
                    ),
                    const Text(
                      'Collection',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'RajBold'),
                    )
                  ],
                ),
              ),

              // Setting Icon
              GestureDetector(
                onTap: () => {
                  setState(() {
                    currentIndex = 2;
                  })
                },
                child: Column(
                  children: [
                    Icon(
                      currentIndex == 2 ? Icons.settings : Iconsax.setting_2,
                      color: currentIndex == 2
                          ? const Color(0xff26547c)
                          : const Color(0xff06d6a0),
                      size: 25,
                    ),
                    const Text(
                      'Setting',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'RajBold'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        // body
        body: screen[currentIndex]);
  }
}
