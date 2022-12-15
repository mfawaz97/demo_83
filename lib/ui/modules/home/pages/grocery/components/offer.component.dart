import 'package:demo_83/ui/common/app_card.component.dart';
import 'package:flutter/material.dart';

class OfferComponent extends StatelessWidget {
  const OfferComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCardComponent(
      colorIndex: 7,
      height: 152,
      width: double.infinity,
      radius: 18,
      child: Row(
        children: [
          const Expanded(flex: 5, child: SizedBox()),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Mega", style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.red, height: 0.4)),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: "WHOP",
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: 32,
                          height: 1.2,
                          color: const Color(0xFF21114B),
                        ),
                    children: [
                      TextSpan(
                        text: "P",
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontSize: 32,
                              height: 1.2,
                              letterSpacing: -6,
                              color: const Color(0xFF21114B),
                            ),
                      ),
                      TextSpan(
                        text: "E",
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontSize: 32,
                              height: 1.2,
                              color: const Color(0xFFD13A27),
                            ),
                      ),
                      TextSpan(
                        text: "R",
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontSize: 32,
                              height: 1.2,
                              color: const Color(0xFF21114B),
                            ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "\$ 12",
                      style: Theme.of(context).textTheme.headline2?.copyWith(color: const Color(0xFFEE6A61), fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    Text(
                      " \$ 18",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "* Available until 24 December 2020",
                  style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
