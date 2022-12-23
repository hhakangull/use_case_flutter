import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

abstract class IFilter {
  String get key;
  int get id;
}

class FilterView<T extends IFilter> extends StatefulWidget {
  const FilterView({
    Key? key,
    required List<T> values,
  })  : _values = values,
        super(key: key);

  final List<T> _values;

  @override
  State<FilterView> createState() => _FilterViewState<T>();
}

class _FilterViewState<T> extends State<FilterView> {
  late final List<IFilter> _cities;
  List<IFilter> filteredItems = [];
  @override
  void initState() {
    super.initState();
    _cities = widget._values;
    filteredItems = widget._values;
  }

  void _findItems(String value) {
    setState(() {
      filteredItems = _cities.where((element) => element.key.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: _findItems,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredItems.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  context.pop(filteredItems[index]);
                },
                title: Text(filteredItems[index].key),
                leading: const Icon(Icons.circle_outlined),
              );
            },
          ),
        ),
      ],
    );
  }
}
