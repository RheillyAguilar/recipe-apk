import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/components/widget_bottom.dart';
import 'package:recipe/model/food.dart';
import 'package:recipe/widget/wishlist_manager.dart';
import 'package:share/share.dart';

class RecipeList extends StatefulWidget {
  final Food food;
  final List<String> recipeList;
  const RecipeList({super.key, required this.food, required this.recipeList});

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  final Map<String, bool> _checkedRecipes = {};
  bool addWishlist = true;

  @override
  void initState() {
    super.initState();
    widget.recipeList.forEach((recipe) {
      _checkedRecipes[recipe] = false;
    });
    addWishlist = WishlistManager().isInWishlist(widget.food);
  }

  void _toggleWishlist() {
    setState(() {
      if (WishlistManager().isInWishlist(widget.food)) {
        WishlistManager().removeFromWishList(widget.food);
        addWishlist = false;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Removed from Wishlist')),
        );
      } else {
        WishlistManager().addToWishList(widget.food);
        addWishlist = true;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Added to Wishlist')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // declare the string of recipe to share
    String recipeShare = '''
      Name: ${widget.food.name}
      Calories: ${widget.food.rateText}
      Time: ${widget.food.timeText}
      Ingredients: ${widget.recipeList.join("\n")}
      Procedure: ${widget.food.recipeStep.join("\n")}''';

    return Scaffold(
      // bottom navigation which is add to meal planner and heart icon and share
      bottomNavigationBar: BottomAppBar(
        height: 80,
        color: const Color(0xfffffcf9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _toggleWishlist();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          addWishlist ? "Remove from favorite" : "Add to favorite",
                          style: const  TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'RajBold',
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Share.share(recipeShare);
              },
              icon: const Icon(
                Icons.share,
                color: Color(0xff26547c),
                size: 30,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xfffffcf9),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // image position
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width - 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.food.image),
                                fit: BoxFit.fill)),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: MediaQuery.of(context).size.width - 50,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                              color: Color(0xfffffcf9),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                        ),
                      ),
                    ],
                  ),
                  // for information of recipe
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // name of recipe and share button
                        Text(
                          widget.food.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              fontFamily: 'RajBold'),
                        ),
                        // Row for rate and time for cooking
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  widget.food.rate,
                                  color: const Color(0xffef476f),
                                  size: 16,
                                ),
                                Text(
                                  widget.food.rateText,
                                  style: const TextStyle(
                                      color: Color(0xff6d676e),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'RajSemi'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  widget.food.time,
                                  color: const Color(0xff26547c),
                                  size: 14,
                                ),
                                Text(
                                  widget.food.timeText,
                                  style: const TextStyle(
                                      color: Color(0xff6d676e),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'RajSemi'),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        // description text
                        const Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'RajBold'),
                        ),
                        // Recipe Description
                        Text(
                          widget.food.description,
                          style: const TextStyle(
                              fontSize: 17,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontFamily: 'RajRegular'),
                        ),
                        const SizedBox(height: 20),
                        // ingredients text
                        const Text(
                          "Ingredients:",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'RajBold'),
                        ),
                        // ingredients list
                        ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.recipeList.length,
                            itemBuilder: (context, index) {
                              String recipe = widget.recipeList[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 0.5),
                                child: CheckboxListTile(
                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: Text(
                                    recipe,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontFamily: 'RajSemi',
                                      decoration: _checkedRecipes[recipe] ?? false
                                          ? TextDecoration.lineThrough
                                          : null,
                                    ),
                                  ),
                                  checkColor: const Color(0xfffffcf9),
                                  activeColor: const Color(0xffef476f),
                                  contentPadding: EdgeInsets.zero,
                                  checkboxShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  value: _checkedRecipes[recipe],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _checkedRecipes[recipe] = value ?? false;
                                    });
                                  },
                                ),
                              );
                            }),
                        const SizedBox(height: 20),
                        // Recipe step Text
                        const Text(
                          "Procedures:",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'RajBold',
                              fontWeight: FontWeight.bold),
                        ),
                        // recipe procedure
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.food.recipeStep.length,
                          itemBuilder: (context, index) {
                            String step = widget.food.recipeStep[index];
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                step,
                                style: const TextStyle(
                                    fontSize: 17, fontFamily: 'RajSemi'),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        //  button add to meal planner

                        // button heart and share
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          // back icon in top
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WidgetBottom()));
              },
              style: IconButton.styleFrom(
                  backgroundColor: const Color(0xff26547c),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  fixedSize: const Size(10, 10)),
              icon: const Icon(
                CupertinoIcons.chevron_back,
                color: Color(0xfffffcf9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
