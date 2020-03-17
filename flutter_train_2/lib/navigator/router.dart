import 'package:flutter/material.dart';
import 'package:flutter_train_2/screens/categories_screen.dart';

import 'route_name.dart';

class Router {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.categoriesPage:
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
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
