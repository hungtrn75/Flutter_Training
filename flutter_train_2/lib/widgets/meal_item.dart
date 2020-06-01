import 'package:flutter/material.dart';
import 'package:flutter_train_2/navigator/route_name.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function deleteMeal;

  MealItem(this.meal, this.deleteMeal);

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(RouteName.mealDetail, arguments: meal)
        .then((mealId) {
      if (mealId != null) {
        deleteMeal(mealId);
      }
    });
  }

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      default:
        return 'Hard';
    }
  }

  String get afordabilityText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: maxWidth * 0.8,
                      minWidth: 200.0,
                    ),
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    child: Text(
                      meal.title,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.timer),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${meal.duration} mins'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$complexityText'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$afordabilityText'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
      ),
    );
  }
}
