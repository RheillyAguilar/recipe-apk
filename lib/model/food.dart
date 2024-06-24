import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

class Food {
  String name;
  String image;
  String description;
  String type;
  String recommended;
  IconData rate;
  String rateText;
  IconData time;
  String timeText;
  List<String> recipeList;
  List<String> recipeStep;

  Food(
      {
      required this.name,
      required this.description,
      required this.type,
      required this.recommended,
      required this.image,
      required this.rate,
      required this.rateText,
      required this.time,
      required this.timeText,
      required this.recipeList,
      required this.recipeStep
});
}

List<Food> foods = [

  // spaghetti https://pinchofyum.com/filipino-spaghetti
  Food(
    name: 'Filipino Spaghetti',
    image: 'assets/images/spaghetti.jpg',
    type: 'breakfast',
    recommended: '',
    rate: CupertinoIcons.gauge,
    rateText: '291 cal',
    time: Iconsax.clock,
    timeText: '75 minutes',
    description:
        "It has a distinctively sweet sauce, usually made from tomato sauce sweetened with brown sugar and banana ketchup. It is typically topped with sliced hot dogs or smoked longganisa sausages, giniling (ground meat), and grated cheese. It is regarded as a comfort food in Philippine cuisine. It is typically served on almost any special occasion, especially on children's birthdays.",
    recipeList: ["1lb spaghetti noodle", "1lb tomato sauce", "8 ounces tomato paste", "2 tablespoon mince onion", "2 tablespoon mine garlic", "2 tablespoon oil", "1lb ground pork", "1/2 cup minced carrots and red pepper", "2 cup diced hotdog", "1 cup water", "1 tablespoon salt", "1 teaspoon seasoning mix", "7 ounces evaporated milk", "grated cheese"],
    recipeStep: ["Step 1. Cook the noodles according to package directions. Set aside.", "Step 2. Place the garlic, onion, and oil in a large saucepan or skillet. Saute for 3-4 minutes or until soft and fragrant. Add the ground pork and brown the meat until it is completely cooked.", "Step 3. Add the minced vegetables and hot dog pieces and stir to combine. Add the water and allow the mixture to simmer for 10-15 minutes. Add the tomato sauce and tomato paste to the meat and continue to simmer the mixture for another 10-15 minutes. Add the evaporated milk and salt and stir until incorporate", 'Step 4. Combine the noodles and the sauce in a large pot or mixing bowl. Top with grated cheese. At Cherne they grate a processed cheese similar to Velveeta and let it melt into the top layer of the spaghetti.']
  ),
  // puto cheese https://www.foxyfolksy.com/puto-cheese/
  Food(
    name: 'Puto Cheese',
    image: 'assets/images/puto.webp',
    type: 'breakfast',
    recommended: 'recommended',
    rate: CupertinoIcons.gauge,
    rateText: '131 cal',
    time: Iconsax.clock,
    timeText: '20 minutes',
    description:
        "Puto is made from rice soaked overnight to allow it to ferment slightly. Yeast may sometimes be added to aid this process. It is then ground (traditionally with stone mills) into a rice dough known as galapong. The mixture is then steamed.",
    recipeList: ["1 cup flour", "1/2 cup sugar", "2 teaspoon baking powder", "1 large egg", "1/2 cup milk(evaporated or fresh)", "1/4 cup water", "1 tablespoon butter melted", "1 teaspoon vanilla extract", "1/4 cup grated cheese", "Strips cheese for topping", "butter or oil for brusing the molds" ],
    recipeStep: ["Step 1. In a mixing bowl, combine flour, sugar and baking powder.", "Step 2. Add the milk and egg and mix using a whisk or electric mixer at medium speed only until batter becomes smooth.", "Step 3. Add the water, butter and vanilla extract and mix well for a minute or two. Lastly, add the grated cheese and fold in slowly using a spatula or spoon.", "Step 4. Grease each mold with butter and fill the molds with batter up to ¾ full.", "Step 5. Fill the bottom of the steamer with water and bring to a gentle simmer over very low heat. Place the molds in the steamer basket and steam for about 10 to 12 minutes or until toothpick inserted comes out clean.", "Step 6. Remove the lid and add a strip of cheese on top of each put. Steam for another minute or two until cheese melts. Turn off heat and let it rest until slightly cooled down.", "Step 7. Remove the cooked Puto Cheese from the molds and transfer to a serving plate."]
  ),
  // kare kare https://panlasangpinoy.com/kare-kare-recipe/
  Food(
    name: 'Kare - Kare',
    image: 'assets/images/karekare.jpg',
    type: 'dish',
    recommended: 'recommended',
    rate: CupertinoIcons.gauge,
    rateText: '934 cal',
    time: Iconsax.clock,
    timeText: '160 minutes',
    description: "Kare-kare is a Philippine stew that features a thick savory peanut sauce. It is generally made from a base of stewed oxtail, beef tripe, pork hocks, calves' feet, pig's feet or trotters, various cuts of pork, beef stew meat, and occasionally offal.",
    recipeList: ["3lbs beef slices", "1 piece small banana flower bud sliced", "1 bundle pechay", "1 bundle string beans cut into 2 inch slices", "4 pieces eggplants sliced", " 1 cup ground peanuts", "1/2 cup peanut butter", " 1/2 cup shrimp paste", "34 ounces water", "1/2 cup annatto seeds", "1/2 cup toaster ground rice", "1tbs garlic", "1 piece onion", "salt and paper"],
    recipeStep: ["Step 1. In a large pot, bring the water to a boil", "Step 2. Put in the oxtail followed by the onions and simmer for 2.5 to 3 hrs or until tender (35 minutes if using a pressure cooker)", "Step 3. Once the meat is tender, add the ground peanuts, peanut butter, and coloring (water from the annatto seed mixture) and simmer for 5 to 7 minutes", "Step 4. Add the toasted ground rice and simmer for 5 minutes", "Step 5. On a separate pan, saute the garlic then add the banana flower, eggplant, and string beans and cook for 5 minutes", "Step 6. Transfer the cooked vegetables to the large pot (where the rest of the ingredients are)", "Step 7. Add salt and pepper to taste", "Step 8. Serve hot with shrimp paste. Enjoy!"]
  ),
  // pandesal https://www.foxyfolksy.com/pandesal-recipe/#recipe
  Food(
    name: 'Pandesal',
    image: 'assets/images/pandesal.jpg',
    type: 'breakfast',
    recommended: 'recommended',
    rate: CupertinoIcons.gauge,
    rateText: '192 cal',
    time: Iconsax.clock,
    timeText: '65 minutes',
    description: "Pandesal, also known as Pan de sal is a staple bread roll in the Philippines commonly eaten for breakfast. It is made of flour, yeast, sugar, oil, and salt.",
    recipeList: ["3 cups all purpose flour", "1/4 cup sugar", "1 cup milk", "1 egg", "2 tablespoon butter", "1 1/2 teaspoon dry yeast", "1/4 cup breadcrumbs"],
    recipeStep: ["Step 1. In a big bowl, mix together flour, sugar, salt.", "Step 2. Pour in milk, beaten egg and melted butter. Mix several times until well blended. Make sure that the milk is only mildly warm and not hot.", "Step 3. Add the instant dry yeast and fold until a sticky dough forms.", "Step 4. Tip the dough on a floured surface and knead until it becomes smooth and elastic, about 5-10 minutes.", "Step 5. Form the dough into a ball and lightly coat with oil. Place it in a bowl and cover with a kitchen towel or plastic wrap and place it in a warm area and let it rise until it doubled in size. Depending how warm it is, could take 30 minutes to an hour.", "Step 6. Punch down the dough and divide into 2 equal parts using a knife or dough slicer. Roll each into a log. Cut each log into 6 smaller pieces.", "Step 7. Shape each piece into a ball and roll it in breadcrumbs, completely covering all sides.", "Step 8. Arrange the pieces on a baking sheet leaving some gaps in between (at least an inch). Leave them to rise second time until double in size.", "Step 9. While waiting, preheat oven 370° F /185°C. Bake the Pandesal for 15 minutes or until the sides are a bit browned.", "Step 10. Remove from oven and serve while hot!"]
  ),
  // hotsilog
  Food(
    name: 'Hotsilog',
    image: 'assets/images/hotsilog.webp',
    type: 'breakfast',
    recommended: '',
    rate: CupertinoIcons.gauge,
    rateText: '104 cal',
    time: Iconsax.clock,
    timeText: '15 minutes',
    description: 'Hotsilog is a class of Filipino breakfast dishes containing hotdog, sinangag (fried rice) and itlog (egg; in context, fried egg "sunny side up").',
    recipeList: ["2 pieaces red hotdog", "1 egg", "6 tablespoon cooking oil", "1 cup garlic with fried rice"],
    recipeStep: ["Step 1. Fried the Rice", "Step 2. Fried the Hotdog", "Step 3. Fried the Egg", "Step 4. Plating and Enjoy the breakfast"]
  ),
  // pinakbet https://www.foxyfolksy.com/pinakbet/#recipe
  Food(
    name: 'Pinakbet',
    image: 'assets/images/pinakbet.jpg',
    type: 'dish',
    recommended: 'recommended',
    rate: CupertinoIcons.gauge,
    rateText: '308 cal',
    time: Iconsax.clock,
    timeText: '45 minutes',
    description: "Pinakbet is an indigenous Filipino dish from the northern regions of the Philippines. Pinakbet is made with a variety of mixed vegetables flavored with bagoóng. ",
    recipeList: ["1 tabespoon oil", "1/2 pound pork belly cut into strips", "1 smallonion - chopped", "2 cloves garlic - minced", "2 - 3 tablespoon shripm paste", "3 medium tomatoes - chopped", "1/2 small squash - peeled and cut into cubes", " 1 cup water", "5 - 7 young okras - ends trimmed, cut into halves diagonally", "1/2 bunch yard-long beans (sitaw) - ends trimmed and cut into 3-inch lengths", "1 medium bitter gourd - seeded then halved and cut into slices", "1 large eggplant - ends trimmed and cut into cubes", "salt"],
    recipeStep: ["Step 1. In a wok or pan,  heat oil over medium-high heat. Add pork and cook until browned and fat rendered.", "Step 2. Lower heat to medium and add the onion and garlic and cook until tender and aromatic. Add tomatoes and cook for about 3-5 minutes or until it becomes soft and the skins peel off the flesh", "Step 3.  Add shrimp paste and continue to cook for about a minute.", "Step 4. Add squash and water. Cover the pan and let it simmer for about 2 minutes.", "Step 5. Add yard-long beans, bitter gourd, and eggplant. Season with salt if needed.  Cook for about 2 minutes. Add the okra and cook for another 2 minutes or until vegetables are tender yet still a bit crisp.", "Step 6. Transfer to a serving plate and serve with rice and your favorite fried meat."]
  ),
  // Hawaiian Pizza https://panlasangpinoy.com/hawaiian-pizza-no-bake/#wprm-recipe-container-78030
  Food( 
    name: 'Hawaiian Pizza', 
    description: "Pizza originating in Canada, traditionally topped with pineapple, tomato sauce, mozzarella cheese, and either ham or bacon.", 
    type: 'snack', 
    recommended: 'recommended', 
    image: 'assets/images/hawaiian.jpg', 
    rate: CupertinoIcons.gauge, 
    rateText: '1157 cal', 
    time: Iconsax.clock, 
    timeText: '50 minutes', 
    recipeList:['75 grams CDO Sweet Ham sliced', '1/2 cup pineapple tidbits', '1/2 cup Pizza Sauce', '3/4 cup mozzarella cheese', '1 cup all-purpose flour', '1/2 teaspoon baking powder', '1/2 teaspoon sugar', '1/2 teaspoon salt', '1/3 cup beer', '1 tablespoon cooking oil'],
    recipeStep: ['Step 1. Make the pizza dough by combining flour, baking powder, sugar, and salt. Mix well', 'Step 2. Add oil and beer. Continue mixing until all the ingredients are fully incorporated.', 'Step 3. Knead the dough until smooth. Form it into a ball. Wrap the dough loosely with plastic wrap. Let it rest for 10 minutes.', 'Step 4. Roll dough out into a 10-inch circle.', 'Step 5. Place the pan over medium-high heat for 30 seconds.', 'Step 6. Transfer the pizza dough in the pan and cover with a lid. Set the stove to medium low heat Cook it until you see large bubbles forming on top, for about 3 minutes. Poke the pizza crust with a fork to deflate the bubbles.', 'Step 7. Flip the pizza crust. Continue cooking for 2 minutes.', 'Step 8. Spread the pizza sauce over the dough. Top with cheese, CDO Sweet Ham sliced, and pineapple tidbits.', 'Step 9. Cover and cook the pizza for another 4 to 5 minutes or until the cheese has melted.', 'Step 10. Remove the pizza from the pan and lay on a wide chopping board. Slice. Serve and enjoy.']),
  // Halo Halo https://www.foxyfolksy.com/halo-halo-recipe/
  Food(
    name: 'Halo Halo', 
    description: 'Halo-halo, also spelled haluhalo, Tagalog for "mixed", is a popular cold dessert in the Philippines made up of crushed ice, evaporated milk or coconut milk, and various ingredients including side dishes such as ube jam (ube halaya), sweetened kidney beans or garbanzo beans, coconut strips, sago, gulaman (agar), pinipig, boiled taro or soft yams in cubes, flan, slices or portions of fruit preserves and other root crop preserves. The dessert is topped with a scoop of ube ice cream. It is usually prepared in a tall clear glass and served with a long spoon', 
    type: 'dessert', 
    recommended: '', 
    image: 'assets/images/halohalo.jpg', 
    rate: CupertinoIcons.gauge, 
    rateText: '195 cal', 
    time: Iconsax.clock, 
    timeText: '5 minutes', 
    recipeList: ['1 cup crushed or shaved ice', '1/4 cup milk fresh or evaporated', '1 teaspoon sugar if needed', '1 teaspoon sweetened saba or plantain bananas', '1 teaspoon sweetened sweet potatoes', '1 teaspoon sweetened red munggo', '1 teaspoon sweetened garbanzos (chickpeas) or beans', '1 teaspoon fresh of sweetened langka jack fruit', '1 teaspoon coconut strips or sweetened macapuno', '1 teaspoon nata de coco coconut gel', '1 teaspoon nata de coco coconut gel', '1 tablespoon leche flan topping', '1 tablespoon ube jam or 1 scoop of ube ice cream topping'], 
    recipeStep: ['Step 1. In a tall glass, add a teaspoon of each of your selected ingredients.', 'Step 2. Add sugar if you like. Personally, I find that the other ingredients are sweet enough so I do not any more sugar.', 'Step 3. Fill the glass with shaved ice up to the brim. Push it down and add some more.', 'Step 4. Drizzle with milk.', 'Step 6. Add the toppings of choice.', "Step 7. Serve with a long spoon for mixing (‘halo’) and enjoy."])


];
