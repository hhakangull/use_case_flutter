import 'package:flutter/material.dart';

enum AssetsImages {
  notFound('flutter.jpeg');

  final String name;
  const AssetsImages(this.name);

  Widget toImage() {
    return Image.asset(
      'assets/$name',
      package: 'uikit',
    );
  }
}
