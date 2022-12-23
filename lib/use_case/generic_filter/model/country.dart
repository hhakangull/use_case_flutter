import 'package:use_case_flutter/use_case/generic_filter/filter_view.dart';

enum Countries {
  istanbul('Istanbul'),
  london('London'),
  roma('Roma'),
  madrid('Madrid'),
  paris('Paris');

  final String uniqName;
  const Countries(this.uniqName);
  static List<String> get names {
    return Countries.values.map((e) => e.uniqName).toList();
  }

  static List<Country> get models {
    return Countries.values.map((e) => Country(e)).toList();
  }
}

class Country extends IFilter {
  final Countries country;

  Country(this.country);

  @override
  int get id => country.index;

  @override
  String get key => country.uniqName;
}
