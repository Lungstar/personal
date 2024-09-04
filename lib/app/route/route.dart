import 'package:flutter/material.dart';
import '../ui/screens/screen_index.dart';
import '../ui/screens/component/quiz.dart';

class AppRoutes {
  static const String home = '/';
  static const String houses = '/houses';
  static const String spells = '/spells';
  static const String elixirs = '/elixirs';
  static const String favorites = '/favorites';
  static const String quiz = '/quiz';
  static const String trivia = '/trivia';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomeScreen(),
    houses: (context) => const HousesScreen(),
    spells: (context) =>  const SpellsScreen(),
    elixirs: (context) => ElixirsScreen(),
    favorites: (context) => FavoritesScreen(),
    quiz: (context) => QuizScreen(),
    trivia: (context) => TriviaScreen(),
  };
}
