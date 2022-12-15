import 'package:demo_83/ui/style/theme.dart';
import 'package:flutter/material.dart';

class TextFieldPlaceHolder extends StatelessWidget {
  final Widget child;
  final bool removeBorder;
  final double radius;
  final Color color;
  const TextFieldPlaceHolder({
    Key? key,
    required this.child,
    this.radius = 4,
    this.removeBorder = true,
    this.color = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: removeBorder
            ? null
            : Border.all(
                color: ownTheme(context).iconColorAlt,
                width: 0.5,
              ),
        color: color,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: child,
      ),
    );
  }
}
