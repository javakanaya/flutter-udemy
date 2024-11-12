import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  // set initial data to empty list
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    // not allowed to edit on an exisiting in memory,
    // instead you always create a new one when using the StateNotifier

    // this state (globaly made by StateNotifier) is holding your data,
    // in this case a list of meal
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      // create a new list which excluded the given meal
      // where give us a new list
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // create a new list, with added new meal
      state = [...state, meal];
      return true;
    }
  }
}

// optimize for data that can changes
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
