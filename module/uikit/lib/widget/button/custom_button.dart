import 'package:flutter/material.dart';

import '../../utility/index.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onPressed,
    this.size = CustomButtonSizes.medium,
    required this.title,
    this.colorScheme,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final CustomButtonSizes size;
  final String title;

  /// [colorScheme] in Scheme [onError]
  final ColorScheme? colorScheme;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: EmptyElevatedStyle(),
      onPressed: () {},
      child: SizedBox(
        height: size.value,
        child: DecoratedBox(
          decoration: CustomButtonDecoration(colorScheme ?? Theme.of(context).colorScheme),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Theme.of(context).colorScheme.onError,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

enum CustomButtonSizes {
  small(30),
  medium(60),
  large(90);

  final double value;
  const CustomButtonSizes(this.value);
}
