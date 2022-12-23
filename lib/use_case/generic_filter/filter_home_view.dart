import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/generic_filter/model/country.dart';

import 'filter_view.dart';

class FilterHomeView extends StatefulWidget {
  const FilterHomeView({Key? key}) : super(key: key);
  @override
  State<FilterHomeView> createState() => _FilterHomeViewState();
}

class _FilterHomeViewState extends State<FilterHomeView> {
  final List<Country> _cities = Countries.models;

  String _name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_name),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await showModalBottomSheet<Country>(
            context: context,
            builder: (context) {
              return FilterView<Country>(values: _cities);
            },
          );

          if (result == null) return;
          setState(() {
            _name = result.country.uniqName;
          });
        },
      ),
      body: Column(),
    );
  }
}
