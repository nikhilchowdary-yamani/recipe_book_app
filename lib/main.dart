import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'favorites_screen.dart';
import 'favorite_recipe_notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoriteRecipeNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/favorites': (context) => FavoritesScreen(),
      },
    );
  }
}