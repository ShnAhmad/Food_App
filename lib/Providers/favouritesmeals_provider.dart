import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/Model/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);
  bool toggleMealFavouriteStatus(Meal meal) {
    final isFavourite = state.contains(meal);

    if (isFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favaouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>(
        (ref) => FavouriteMealsNotifier());
