import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'recipe.dart';
import 'details_screen.dart';
import 'favorite_recipe_notifier.dart';

class HomeScreen extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(
      name: "Omelette",
      ingredients: "Eggs, Onion, Chillies.",
      instructions: "Break the eggs into a small container, add required amount of spices adn chopped onions and chillies. Mix them well pour the  mixture on tht pan and fry for some time .",
    ),
    Recipe(
      name: "Rice",
      ingredients: "Pulses and water",
      instructions: "Take pulses in a bowl and wash them twice and add water in the ration 1(rice):2(water). Place it on the stove for 15 mins. Your rice is ready",
    ),
    Recipe(
      name: "Chicken",
      ingredients: "Chicken, Onion, Garlic, Ginger, Tomato Paste, Lemon Juice, Garam Masala, and Ground Cumin.",
      instructions: "Marinate the chicken, Grill the chicken, In a pan, cook the onions, garlic, and ginger, Add the tomato paste, spices, and other ingredients, Pour the spiced gravy over the chicken"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recipe Book")),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            title: Text(recipe.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(recipe: recipe),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/favorites');
        },
        child: Icon(Icons.favorite),
      ),
    );
  }
}