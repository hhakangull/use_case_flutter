import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/generic_filter/filter_view.dart';

enum ColorsEnum {
  red(Colors.red),
  green(Colors.green),
  blue(Colors.green),
  yellow(Colors.yellow),
  black(Colors.black);

  final Color uniqueColors;
  const ColorsEnum(this.uniqueColors);

  static List<ColorModels> get models {
    return ColorsEnum.values.map((e) => ColorModels(e)).toList();
  }
}

class ColorModels extends IFilter {
  final ColorsEnum color;

  ColorModels(this.color);
  @override
  int get id => color.index;
  @override
  String get key => color.name;
}
