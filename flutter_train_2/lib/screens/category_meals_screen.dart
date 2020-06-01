import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';
import '../mocks/dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  final String categoryId;
  final String categoryTitle;

  CategoryMealsScreen({this.categoryId, this.categoryTitle});

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> categogryMeals;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      categogryMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(widget.categoryId);
      }).toList();
    });
  }

  void _deleteMeal(String mealId) {
    setState(() {
      categogryMeals.removeWhere((el) => el.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(categogryMeals[index],_deleteMeal);
        },
        itemCount: categogryMeals.length,
      ),
    );
  }
}
