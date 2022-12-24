import 'package:flutter/material.dart';

import '../radius/circular_custom_radius.dart';

class CustomButtonDecoration extends BoxDecoration {
  /// Gradient Color use [colorScheme.error] and on [colorScheme.surface]
  CustomButtonDecoration(ColorScheme colorScheme)
      : super(
          borderRadius: CustomRadius.circular(),
          gradient: LinearGradient(
            colors: [
              colorScheme.error,
              colorScheme.onSurface,
            ],
          ),
        );
}
