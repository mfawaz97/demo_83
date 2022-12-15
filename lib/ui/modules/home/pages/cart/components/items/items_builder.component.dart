import 'package:demo_83/getx/cart.controller.dart';
import 'package:demo_83/ui/modules/home/pages/cart/components/items/item.component.dart';
import 'package:demo_83/util/dummy_data.dart';
import 'package:flutter/material.dart';

class ItemsBuilderComponent extends StatefulWidget {
  final CartController cartController;
  const ItemsBuilderComponent({super.key, required this.cartController});

  @override
  State<ItemsBuilderComponent> createState() => _ItemsBuilderComponentState();
}

class _ItemsBuilderComponentState extends State<ItemsBuilderComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        itemCount: DummyDataGenerator().cartItems.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ItemComponent(
            index: index,
            item: DummyDataGenerator().cartItems[index],
            cartController: widget.cartController,
          );
        },
      ),
    );
  }
}
