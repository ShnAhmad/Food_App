import 'package:flutter/material.dart';
import 'package:foodapp/Providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenfree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenfree, isChecked);
            },
            title: Text(
              'Gluten-Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only inculde gluten free meals',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 20, right: 30),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactosefree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactosefree, isChecked);
            },
            title: Text(
              'Lactose-Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only inculde lactose free meals',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 20, right: 30),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegeterian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegeterian, isChecked);
            },
            title: Text(
              'Vegeterian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only inculde vegeterain meals',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 20, right: 30),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only inculde vegan free meals',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 20, right: 30),
          ),
        ],
      ),
    );
  }
}


  //  PopScope(
  //     canPop:
  //           true, //! if false block the back button to navigate manualy with data below.
  //       onPopInvoked: (bool dipop) {
  //         //? If dipop(canpop) is true, it means the back gesture was successful,and wii return
  //         if (dipop) {
  //           //passing the chosen filters to provider
  //           ref.read(filtersProvider.notifier).filtersChoosed({
  //             Filter.glutenfree: glutenFreeFilterSet,
  //             Filter.lactosefree: lactoseFreeFilterSet,
  //             Filter.vegeterian: vegeterianFilterSet,
  //             Filter.vegan: veganFilterSet,
  //           });
  //           return;
  //         }
  //         //! if false then the following code will execute using pop we want to navigate with data manualy
         // else {
         //   print('poping manualy');
        //   Navigator.of(context).pop({
        //     Filter.glutenfree: glutenFreeFilterSet,
         //     Filter.lactosefree: lactoseFreeFilterSet,
         //     Filter.vegeterian: vegeterianFilterSet,
         //     Filter.vegan: veganFilterSet,
         //   });
         // }
  //       },