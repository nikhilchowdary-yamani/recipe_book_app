import 'package:flutter/material.dart';
import 'recipe.dart';

class FavoriteRecipeNotifier with ChangeNotifier {
  List<Recipe> _favoriteRecipes = [];

  List<Recipe> get favoriteRecipes => _favoriteRecipes;

  // Add a recipe to favorites
  void addFavoriteRecipe(Recipe recipe) {
    if (!_favoriteRecipes.contains(recipe)) {
      _favoriteRecipes.add(recipe);
      notifyListeners();
    }
  }

  // Remove a recipe from favorites
  void removeFavoriteRecipe(Recipe recipe) {
    _favoriteRecipes.remove(recipe);
    notifyListeners();
  }
}