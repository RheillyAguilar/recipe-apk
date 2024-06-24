import 'package:flutter/material.dart';
import 'package:recipe/model/categories.dart';

class MyCategories extends StatefulWidget {
  const MyCategories({super.key});

  @override
  State<MyCategories> createState() => _MyCategoriesState();
}

class _MyCategoriesState extends State<MyCategories> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
            Row(
              children: List.generate(
                  categories.length,
                  (index) => GestureDetector(
                    onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => categories[index].destination));
                    },
                    child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: const Color(0xffffd166))),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      categories[index].imageFoodtpye,
                                      height: 50,
                                      width: 50,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      categories[index].foodType,
                                      style: const TextStyle(
                                          fontFamily: 'RajSemi',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Color(0xff26547c)),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                  )),
            ),
          
        ],
      ),
    );
  }
}
