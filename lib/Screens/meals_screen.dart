import 'package:flutter/material.dart';
import 'package:foodapp/Model/meal.dart';
import 'package:foodapp/widgets/meals_sc/meal_items.dart';
import 'package:foodapp/Screens/meals_deatail_screen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.filteredMeals,
    this.title,
    required this.onSelectFavourite,
  });
  final String? title;
  final List<Meal> filteredMeals;
  final void Function(Meal meal) onSelectFavourite;

  void selectedMeal(BuildContext context, meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsDetailsScreen(
              meal: meal,
              onSelectFavourite: onSelectFavourite,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: filteredMeals.length,
      itemBuilder: (ctx, index) => MealItems(
        meal: filteredMeals[index],
        onSelectMeal: selectedMeal,
      ),
    );
    if (filteredMeals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Oh...No Meals ',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Try another Category',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }
    if (title == null) return content;
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
