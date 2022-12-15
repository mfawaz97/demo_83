import 'package:demo_83/data/models/deal.model.dart';
import 'package:demo_83/ui/common/app_card.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/state_manager.dart';

class DealComponent extends StatefulWidget {
  final Deal deal;
  final int index;
  const DealComponent({super.key, required this.deal, this.index = 0});

  @override
  State<DealComponent> createState() => _DealComponentState();
}

class _DealComponentState extends State<DealComponent> {
  RxBool isFav = false.obs;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ignore: prefer_const_constructors
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 4),
              child: AppCardComponent(
                colorIndex: widget.index,
                height: 90,
                width: 90,
                radius: 8,
              ),
            ),
            GestureDetector(
              onTap: () {
                isFav.toggle();
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Obx(
                  (() => SvgPicture.asset(
                        "assets/images/${isFav.isTrue ? "red" : "white"}_heart.svg",
                        height: 20,
                        width: 20,
                      )),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.deal.title,
              style: Theme.of(context).textTheme.headline2,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(height: 8),
            Text(
              "Pieces ${widget.deal.count}",
              style: Theme.of(context).textTheme.bodyText1,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/images/location_mark.svg",
                  height: 12,
                  width: 10,
                  color: Theme.of(context).textTheme.bodyText1?.color,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  widget.deal.location,
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "\$ ${widget.deal.afterDeal}",
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "\$ ${widget.deal.beforeDeal}",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(decoration: TextDecoration.lineThrough),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
