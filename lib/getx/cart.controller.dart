import 'package:get/state_manager.dart';

class CartController extends GetxController {
  RxInt cartTotal = 0.obs;
  increment(int price) {
    cartTotal += price;
  }

  decrement(int price) {
    cartTotal -= price;
  }

  setCartTotal(int total) {
    cartTotal = total.obs;
  }
}
