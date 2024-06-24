import 'package:flutter/material.dart';
import 'package:recipe/components/recipe_list.dart';
import 'package:recipe/model/food.dart';

class SearchResult extends StatelessWidget {
  final List<Food> searchResults;

  const SearchResult({super.key, required this.searchResults});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            final food = searchResults[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeList(
                      food: food,
                      recipeList: food.recipeList,
                    ),
                  ),
                );
              },
              child: Container(
                width: 220,
                margin: const EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(food.image),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      food.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RajBold',
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          food.rate,
                          color: const Color(0xffef476f),
                          size: 15,
                        ),
                        Text(
                          food.rateText,
                          style: const TextStyle(
                            color: Color(0xff6d676e),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RajSemi',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          food.time,
                          size: 14,
                          color: const Color(0xff26547c),
                        ),
                        Text(
                          food.timeText,
                          style: const TextStyle(
                            color: Color(0xff6d676e),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RajSemi',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: searchResults.length,
        ),
      ),
    );
  }
}
