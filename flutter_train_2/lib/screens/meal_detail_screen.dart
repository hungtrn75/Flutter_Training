import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  Widget buildSection(BuildContext context, String title, List<String> props) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Container(
          width: 300,
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).accentColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: ListView.builder(
            itemCount: props.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  color: Theme.of(context).accentColor,
                  padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 5),
                  child: Text(props[index]),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget buildSteps(BuildContext context, String title, List<String> props) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Container(
          width: 300,
          height: 170,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).accentColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: ListView.builder(
            itemCount: props.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(
                    '#${index + 1}',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                title: Text(props[index]),
              );
            },
          ),
        )
      ],
    );
  }

  MealDetailScreen(this.meal);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSection(context, 'Ingredients', meal.ingredients),
              buildSteps(context, 'Steps', meal.steps),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(meal.id);
        },
      ),
    );
  }
}
