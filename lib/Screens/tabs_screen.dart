import 'package:flutter/material.dart';
import 'package:foodapp/Data/dummy_data.dart';
import 'package:foodapp/Providers/favourites_provider.dart';
import 'package:foodapp/Screens/category_screen.dart';
import 'package:foodapp/Screens/filters_screen.dart';
import 'package:foodapp/widgets/tab_sc/main_drawer.dart';
import 'package:foodapp/Screens/meals_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kintialFilters = {
  Filter.glutenfree: false,
  Filter.lactosefree: false,
  Filter.vegeterian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  Map<Filter, bool> selectedFilter = kintialFilters;
  int selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

//for drawer
  void selectedScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      final result =
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
              builder: (ctx) => FiltersScreen(
                    currentFilters: selectedFilter,
                  )));
      setState(() {
        selectedFilter = result ?? kintialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final avilableMeals = dummyMeals.where((meal) {
      if (selectedFilter[Filter.glutenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilter[Filter.lactosefree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilter[Filter.vegeterian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoryScreen(
      availbaleMeals: avilableMeals,
    );
    String activePagetitle = 'Categories';

    if (selectedPageIndex == 1) {
      //! favouriteMeals wiil automaticaty store the state varaiable of provider which contain a list
      final favouriteMeals = ref.watch(favaouriteMealsProvider);
      activePage = MealsScreen(
        filteredMeals: favouriteMeals,
      );
      activePagetitle = 'Favourites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePagetitle)),
      body: activePage,
      drawer: MainDrawer(onSelectScreen: selectedScreen),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        backgroundColor: Theme.of(context).colorScheme.background,
        onTap: selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.set_meal,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'Favourite',
          ),
        ],
      ),
    );
  }
}
