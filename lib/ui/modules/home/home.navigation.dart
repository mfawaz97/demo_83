import 'package:demo_83/data/models/item.model.dart';
import 'package:demo_83/getx/cart.controller.dart';
import 'package:demo_83/ui/modules/home/components/address_holder.component.dart';
import 'package:demo_83/ui/modules/home/components/bottom_bar.component.dart';
import 'package:demo_83/ui/modules/home/pages/cart/cart.page.dart';
import 'package:demo_83/ui/modules/home/pages/grocery/grocery.page.dart';
import 'package:demo_83/ui/style/theme.dart';
import 'package:demo_83/util/app_localization.dart';
import 'package:demo_83/util/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CartController cartController = Get.put(CartController());
  @override
  void initState() {
    super.initState();
    int cartTotal = 0;
    for (Item item in DummyDataGenerator().cartItems) {
      cartTotal += item.count * item.price;
    }
    cartController.setCartTotal(cartTotal);
  }

  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 12, top: 8, end: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ignore: prefer_const_constructors
                  AddressHolderComponent(
                    address: AppLocalizations.of(context).translate(DummyDataGenerator().addresses.first.street),
                  ),
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      border: Border.all(color: ownTheme(context).textColorAlt2, width: 1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: const [
                  GroceryPage(),
                  CartPage(),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ownTheme(context).buttonColorAlt,
        // ignore: sort_child_properties_last
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Obx(() {
                return Text(
                  AppLocalizations.of(context).translate("price_with_rep", replacement: cartController.cartTotal),
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                );
              }),
            ),
            SvgPicture.asset(
              "assets/images/cart.svg",
              height: 32,
              width: 36,
              color: Colors.white,
            ),
          ],
        ),
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBarComponent(
        pageController: pageController,
      ),
    );
  }
}
