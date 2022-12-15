import 'package:demo_83/getx/cart.controller.dart';
import 'package:demo_83/util/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/items/items_builder.component.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final CartController cartController = Get.find();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 32, start: 24, end: 24, bottom: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).translate("cart"),
              style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ItemsBuilderComponent(
              cartController: cartController,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
