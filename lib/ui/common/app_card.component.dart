import 'package:demo_83/ui/style/theme.dart';
import 'package:flutter/material.dart';

class AppCardComponent extends StatelessWidget {
  final double? width;
  final double? height;
  final int? colorIndex;
  final double? radius;
  final Widget? child;
  final bool hasBorder;
  const AppCardComponent({
    Key? key,
    this.width,
    this.height,
    this.colorIndex,
    this.radius,
    this.child,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 0),
        border: Border.all(color: ownTheme(context).iconColorAlt.withOpacity(0.4), width: 0.5),
        color: colorIndex == null
            ? Theme.of(context).primaryColor
            : colorIndex == 0
                ? const Color(0xFFD7D7D7)
                : colorIndex == 1
                    ? const Color(0xFFF9BDAD)
                    : colorIndex == 2
                        ? const Color(0xFFFAD96D)
                        : colorIndex == 3
                            ? const Color(0xFFCCB8FF)
                            : colorIndex == 4
                                ? const Color(0xFFB0EAFD)
                                : colorIndex == 5
                                    ? const Color(0xFFFBEDD8)
                                    : colorIndex == 6
                                        ? const Color(0xFFB0EAFD)
                                        : const Color(0xFFFEC8BD),
      ),
      child: child,
    );
  }
}
