import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreens extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreens(
      {super.key, required this.saveFilters, required this.currentFilters});
  static const routeName = '/filters-screen';

  @override
  State<FiltersScreens> createState() => _FiltersScreensState();
}

class _FiltersScreensState extends State<FiltersScreens> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;
  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  Widget _buildSwitchListTile(bool selectedValue, String title, String subtitle,
      void Function(bool value) updatedValue) {
    return SwitchListTile(
      activeColor: Theme.of(context).colorScheme.secondary,
      value: selectedValue,
      onChanged: updatedValue,
      title: Text(title,
          style: const TextStyle(
              fontFamily: 'Raleway',
              fontSize: 16,
              fontWeight: FontWeight.w500)),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.black45),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(selectedFilters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const Drawer(
        child: MainDrawer(),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  _glutenFree, 'Gluten-free', 'Only include Gluten-free meals',
                  (newvalue) {
                setState(() {
                  _glutenFree = newvalue;
                });
              }),
              _buildSwitchListTile(_lactoseFree, 'Lactose-free',
                  'Only icnlude Lactose-free meals', (newvalue) {
                setState(() {
                  _lactoseFree = newvalue;
                });
              }),
              _buildSwitchListTile(_vegan, 'Vegan', 'Only include Vegan meals',
                  (newvalue) {
                setState(() {
                  _vegan = newvalue;
                });
              }),
              _buildSwitchListTile(
                  _vegetarian, 'Vegetarian', 'Only include Vegetarian meals',
                  (newvalue) {
                setState(() {
                  _vegetarian = newvalue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
