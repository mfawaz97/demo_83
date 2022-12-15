import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:demo_83/ui/style/theme.dart';
import 'package:demo_83/util/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBarComponent extends StatefulWidget {
  final PageController pageController;

  const BottomBarComponent({super.key, required this.pageController});

  @override
  State<BottomBarComponent> createState() => _BottomBarComponentState();
}

class _BottomBarComponentState extends State<BottomBarComponent> {
  int currentSelectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: 4,
      height: kToolbarHeight * 1.2,
      elevation: 0,
      backgroundColor: Theme.of(context).bottomAppBarTheme.color,
      tabBuilder: (index, isActive) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/${index == 0 ? "home" : index == 1 ? "bell" : index == 2 ? "heart" : "wallet"}.svg",
              height: 20,
              width: 20,
              color: isActive ? ownTheme(context).iconColorAlt2 : ownTheme(context).iconColorAlt,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              AppLocalizations.of(context).translate(
                index == 0
                    ? "grocery"
                    : index == 1
                        ? "news"
                        : index == 2
                            ? "favorites"
                            : "cart",
              ),
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: isActive ? ownTheme(context).iconColorAlt2 : ownTheme(context).iconColorAlt,
                    height: 1.4,
                  ),
            ),
          ],
        );
      },
      gapLocation: GapLocation.center,
      notchMargin: 0,
      notchSmoothness: NotchSmoothness.sharpEdge,
      splashColor: Colors.transparent,
      activeIndex: currentSelectedTab,
      onTap: (int index) {
        if (index != currentSelectedTab && (index == 0 || index == 3)) {
          widget.pageController.animateToPage(index == 0 ? 0 : 1, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
          setState(() {
            currentSelectedTab = index;
          });
        }
      },
    );
  }
}
