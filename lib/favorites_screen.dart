import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_recipe_notifier.dart';
import 'details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteRecipes = Provider.of<FavoriteRecipeNotifier>(context).favoriteRecipes;

    return Scaffold(
      appBar: AppBar(title: Text("Favorite Recipes")),
      body: favoriteRecipes.isEmpty
          ? Center(child: Text("No favorite recipes yet"))
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                final recipe = favoriteRecipes[index];
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
    );
  }
}