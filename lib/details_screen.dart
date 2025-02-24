import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'recipe.dart';
import 'favorite_recipe_notifier.dart';

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;

  DetailsScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    // Access the FavoriteRecipeNotifier
    final favoriteNotifier = Provider.of<FavoriteRecipeNotifier>(context);

    // Check if the recipe is a favorite
    final isFavorite = favoriteNotifier.favoriteRecipes.contains(recipe);

    return Scaffold(
      appBar: AppBar(title: Text(recipe.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ingredients:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(recipe.ingredients),
            SizedBox(height: 10),
            Text("Instructions:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(recipe.instructions),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if (isFavorite) {
                  favoriteNotifier.removeFavoriteRecipe(recipe);
                } else {
                  favoriteNotifier.addFavoriteRecipe(recipe);
                }
              },
              child: Text(isFavorite ? "Remove from Favorites" : "Add to Favorites"),
            ),
          ],
        ),
      ),
    );
  }
}