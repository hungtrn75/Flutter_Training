import 'package:flutter/material.dart';
import 'navigator/route_name.dart';
import 'navigator/router.dart';
import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map <String,bool> _filters = {
    'gluten':false,
    'vegetarian':false,
    'vega':false,
    'lactose':false,
  };

  void _setFilters(Map<String,bool> filterData){
    setState(() {
      _filters = filterData;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Colors.black,
          ),
          title: TextStyle(
            color: Colors.black,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.w700
          )
        )
      ),
      initialRoute: RouteName.bottomBar,
      onGenerateRoute: Router.generateRoute,
//      home: CategoriesScreen(),
    );
  }
}
