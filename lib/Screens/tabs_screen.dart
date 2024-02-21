import 'package:flutter/material.dart';
import 'package:foodapp/Providers/favouritesmeals_provider.dart';
import 'package:foodapp/Screens/category_screen.dart';
import 'package:foodapp/Screens/filters_screen.dart';
import 'package:foodapp/widgets/tab_sc/main_drawer.dart';
import 'package:foodapp/Screens/meals_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/Providers/filters_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

//for drawer
  void selectedScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    }
  }
//! this code is is to store coming data from another screen while poping
  //  void selectedScreen(String identifier) async {
  //   Navigator.of(context).pop();
  //   if (identifier == 'Filters') {
  //     final result =
  //         await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
  //             builder: (ctx) => FiltersScreen(
  //                   currentFilters: selectedFilter,
  //                 )));
  //     setState(() {
  //       selectedFilter = result ?? kintialFilters;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    //!based filterMealprovider which depends on filter provider dummy meels should be modified to display Meals
    final avilableMeals = ref.watch(filterMealsProvider);

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
