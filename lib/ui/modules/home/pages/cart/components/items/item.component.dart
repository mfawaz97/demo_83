import 'package:demo_83/data/models/item.model.dart';
import 'package:demo_83/getx/cart.controller.dart';
import 'package:demo_83/ui/common/app_card.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemComponent extends StatefulWidget {
  final int index;
  final Item item;
  final CartController cartController;
  const ItemComponent({super.key, required this.item, required this.index, required this.cartController});

  @override
  State<ItemComponent> createState() => _ItemComponentState();
}

class _ItemComponentState extends State<ItemComponent> {
  RxInt totalPrice = 0.obs;
  RxInt totalCount = 0.obs;
  @override
  void initState() {
    super.initState();
    totalPrice = widget.item.price.obs;
    totalCount = widget.item.count.obs;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          AppCardComponent(
            colorIndex: widget.index,
            height: 56,
            width: 56,
            radius: 12,
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.name,
                  style: Theme.of(context).textTheme.headline4,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  "${widget.item.weight} ${widget.item.weightUnit}",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(color: const Color(0xFF8D97A4)),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Obx(
                  () => Text(
                    "\$ $totalPrice",
                    style: Theme.of(context).textTheme.headline4?.copyWith(color: const Color(0xFFB13E55), fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (totalCount > 0) {
                    totalPrice -= widget.item.price;
                    widget.cartController.decrement(widget.item.price);
                    totalCount--;
                  }
                },
                child: AppCardComponent(
                  colorIndex: 6,
                  height: 34,
                  width: 34,
                  radius: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      "assets/images/minus.svg",
                      height: 4,
                      width: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 40,
                child: Obx(
                  () => Text(
                    totalCount.toString(),
                    style: Theme.of(context).textTheme.headline1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  totalPrice += widget.item.price;
                  widget.cartController.increment(widget.item.price);
                  totalCount++;
                },
                child: AppCardComponent(
                  colorIndex: 6,
                  height: 34,
                  width: 34,
                  radius: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      "assets/images/plus.svg",
                      height: 18,
                      width: 18,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
