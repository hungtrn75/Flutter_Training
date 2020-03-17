import 'package:flutter/material.dart';
import 'package:flutter_train_2/mocks/dummy_data.dart';
import 'package:flutter_train_2/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Container(
        child:
        GridView(
          padding: EdgeInsets.all(10),
          children: CATEGORIES
              .map((category) => CategoryItem(
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
        ),
      ),
    );
  }
}
