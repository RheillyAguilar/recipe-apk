import 'package:flutter/material.dart';
import 'package:recipe/components/search_result.dart';
import 'package:recipe/model/food.dart';
import 'package:recipe/widget/app_bar.dart';
import 'package:recipe/widget/cateGories.dart';
import 'package:recipe/widget/home_search_bar.dart';
import 'package:recipe/widget/recipe_image_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _updateSearchQuery(String query) {
    final filteredFoods = foods.where((food) {
      return food.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (filteredFoods.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No results found'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResult(searchResults: filteredFoods),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffcf9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // app bar
                const MyAppBar(),
                const SizedBox(height: 20),
                // search field
                MyHomeSearchBar(onSearch: _updateSearchQuery),
                const SizedBox(height: 20),
                // home image
                Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('assets/home-background.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // what's on for today
                const Text(
                  "What's on for today",
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'RajBold',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const MyCategories(),
                const SizedBox(height: 20),
                // recommended container
                const Text(
                  "Recommended",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    fontFamily: 'RajBold',
                  ),
                ),
                const SizedBox(height: 5),
                // snack information
                const RecipeImageText(isRecommended: 'recommended'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
