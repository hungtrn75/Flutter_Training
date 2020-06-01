import 'package:flutter/material.dart';
import 'package:flutter_train_2/models/meal.dart';
import 'package:flutter_train_2/screens/bottom_bar_screen.dart';
import 'package:flutter_train_2/screens/categories_screen.dart';
import 'package:flutter_train_2/screens/category_meals_screen.dart';
import 'package:flutter_train_2/screens/filters_screen.dart';
import 'package:flutter_train_2/screens/meal_detail_screen.dart';
import 'package:flutter_train_2/screens/tabs_screen.dart';

import 'route_name.dart';

class Router {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.tabBar:
        return MaterialPageRoute(builder: (context) => TabsScreen());
      case RouteName.bottomBar:
        return MaterialPageRoute(builder: (context) => BottomBarScreen());
      case RouteName.filtersPage:
        return MaterialPageRoute(builder: (context) => FiltersScreen());
      case RouteName.categoriesPage:
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      case RouteName.categoryMeals:
        Map<String, String> args = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => CategoryMealsScreen(
                  categoryId: args['id'],
                  categoryTitle: args['title'],
                ));
      case RouteName.mealDetail:
        Meal meal = settings.arguments;
        return MaterialPageRoute(builder: (context) => MealDetailScreen(meal));
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
