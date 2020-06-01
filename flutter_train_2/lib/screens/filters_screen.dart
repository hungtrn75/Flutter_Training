import 'package:flutter/material.dart';
import 'package:flutter_train_2/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
    String title,
    String subtitle,
    Function onChange,
    bool value,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: onChange,
      value: value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                    'Gluten-free',
                    'Only include gluten-free meals.',
                    (bool value) {
                      setState(() {
                        _glutenFree = value;
                      });
                    },
                    _glutenFree,
                  ),_buildSwitchListTile(
                    'Vegetarian',
                    'Only include vegetarian meals.',
                    (bool value) {
                      setState(() {
                        _vegetarian = value;
                      });
                    },
                    _vegetarian,
                  ),_buildSwitchListTile(
                    'Vegan',
                    'Only include vegan meals.',
                    (bool value) {
                      setState(() {
                        _vegan = value;
                      });
                    },
                    _vegan,
                  ),_buildSwitchListTile(
                    'Lactose-free',
                    'Only include gluten-free meals.',
                    (bool value) {
                      setState(() {
                        _lactoseFree = value;
                      });
                    },
                    _lactoseFree,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
