import 'package:flutter/material.dart';
import 'package:flutter_train_2/mocks/dummy_data.dart';
import 'package:flutter_train_2/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  CategoriesScreen({this.categoryId, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      children: DUMMY_CATEGORIES
          .map((category) => CategoryItem(
                id: category.id,
                title: category.title,
                color: category.color,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        maxCrossAxisExtent: 300,
        childAspectRatio: 1.5,
      ),
    );
  }
}
