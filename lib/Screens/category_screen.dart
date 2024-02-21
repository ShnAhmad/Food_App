import 'package:flutter/material.dart';
import 'package:foodapp/Data/dummy_data.dart';
import 'package:foodapp/Screens/meals_screen.dart';
import 'package:foodapp/Model/meal.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.availbaleMeals,
  });
  final List<Meal> availbaleMeals;

  @override
  Widget build(BuildContext context) {
    void selectedCategory(BuildContext context, category) {
      final filteredMeals = availbaleMeals
          .where((meal) => meal.categories.contains(category.id))
          .toList();

      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => MealsScreen(
                filteredMeals: filteredMeals,
                title: category.title,
              )));
    }

    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          InkWell(
            onTap: () {
              selectedCategory(context, category);
            },
            splashColor: Theme.of(context).primaryColorLight,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    category.color.withOpacity(0.55),
                    category.color.withOpacity(0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text(
                category.title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.background),
              ),
            ),
          ),
      ],
    );
  }
}
