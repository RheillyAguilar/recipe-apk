import 'package:flutter/material.dart';
import 'package:recipe/components/recipe_list.dart';
import 'package:recipe/model/food.dart';
import 'package:recipe/widget/wishlist_manager.dart';


class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {

  List<Food> wishlistItems = WishlistManager().wishlist;

  void _removeFromWishlist(Food food) {
    setState(() {
      wishlistItems.remove(food);
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Wishlist',
        style: TextStyle(
          fontFamily: "RajSemo",
          fontSize: 30,
          color: Color(0xffef476f),
          fontWeight: FontWeight.bold),),
        backgroundColor: const Color(0xfffffcf9),
      ),
      backgroundColor: const Color(0xfffffcf9),
      body: ListView.builder(
        itemCount: wishlistItems.length,
        itemBuilder: (context, index) {
          Food food = wishlistItems[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeList(food: wishlistItems[index], recipeList: wishlistItems[index].recipeList)));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffffd166)),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(food.image,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,),
                      ),
                      Column(
                        children: [
                          Text(food.name, style: const  TextStyle(
                            fontSize: 20,
                            fontFamily: 'RajSemi',
                            fontWeight: FontWeight.bold
                          ),),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(food.rate, size: 15, color: const Color(0xffef476f),),
                                  Text(food.rateText, style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'RajSemi'
                                  ),)
                                ],
                              ),
                              const SizedBox(width: 10,),
                              Row(
                                children: [
                                  Icon(food.time, size: 15, color: const Color(0xff26547c),),
                                  Text(food.timeText, style:const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'RajSemi'
                                  ),)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      IconButton(
                            onPressed: () {
                              _removeFromWishlist(food);
                            }, 
                            icon: const Icon(Icons.highlight_remove,
                            color: Color(0xffef476f),
                            size: 35,))
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