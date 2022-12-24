import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/generic_filter/model/color_model.dart';
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
          final result = await FilterView<ColorModels>(values: ColorsEnum.models)
              .showSheet(context: context, items: ColorsEnum.models);
          // final result2 = FilterView<Country>(values: Countries.models)
          //     .showSheet(context: context, items: Countries.models);

          if (result == null) return;
          // if (result2 == null) return;
          setState(() {
            _name = result.key;
          });
        },
      ),
      body: Column(),
    );
  }
}
