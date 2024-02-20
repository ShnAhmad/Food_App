import 'package:flutter/material.dart';

enum Filter {
  glutenfree,
  lactosefree,
  vegeterian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenFreeFilterSet = false;
  var lactoseFreeFilterSet = false;
  var vegeterianFilterSet = false;
  var veganFilterSet = false;
  @override
  void initState() {
    super.initState();
    glutenFreeFilterSet = widget.currentFilters[Filter.glutenfree]!;
    lactoseFreeFilterSet = widget.currentFilters[Filter.lactosefree]!;
    vegeterianFilterSet = widget.currentFilters[Filter.vegeterian]!;
    veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: PopScope(
        canPop:
            false, //block the back button to navigate manualy with data below.
        onPopInvoked: (bool dipop) {
          if (dipop) {
            // If dipop is true, it means the back gesture was successful,and wii return
            return;
          }
          // if false then the following code will execute
          else {
            print('poping manualy');
            Navigator.of(context).pop({
              Filter.glutenfree: glutenFreeFilterSet,
              Filter.lactosefree: lactoseFreeFilterSet,
              Filter.vegeterian: vegeterianFilterSet,
              Filter.vegan: veganFilterSet,
            });
          }
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  glutenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'only inculde gluten free meals',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 20, right: 30),
            ),
            SwitchListTile(
              value: lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'only inculde lactose free meals',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 20, right: 30),
            ),
            SwitchListTile(
              value: vegeterianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  vegeterianFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegeterian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'only inculde vegeterain meals',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 20, right: 30),
            ),
            SwitchListTile(
              value: veganFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  veganFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'only inculde vegan free meals',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 20, right: 30),
            ),
          ],
        ),
      ),
    );
  }
}
