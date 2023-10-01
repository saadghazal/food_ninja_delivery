import 'package:food_delivery_green/services/local_storage_service/cart_storage.dart';
import 'package:get/get.dart';

import '../models/restaurant_models/rest_meals_model.dart';

class CartController extends GetxController {
  List<RestMeals> cartItems = [];
  bool? existingFlag;
  Rx<double> totalPrice = 0.0.obs;
  Rx<double> totalDiscount = 0.0.obs;
  Rx<double> totalItemsPrice = 0.0.obs;
  @override
  onReady() async {
    await getCartItems();
    super.onReady();
  }

  Future<void> getCartItems() async {
    CartStorage cartStorage = CartStorage();
    var cartBox = await CartStorage.openCartBox();
    var cart = await cartStorage.getCartItems(cartBox);
    cartItems = cart;
    update();
  }

  Future<void> addCartItem(RestMeals cartItem) async {
    existingFlag = false;
    for (var element in cartItems) {
      if (element == cartItem) {
        existingFlag = true;
        continue;
      }
    }
    if (existingFlag!) {
      return;
    }

    CartStorage cartStorage = CartStorage();
    var cartBox = await CartStorage.openCartBox();
    cartStorage.addCartItem(cartBox, cartItem);
    cartItems = [];
    cartItems = await cartStorage.getCartItems(cartBox);
    update();
  }

  Future<void> deleteCartItem(RestMeals cartItem) async {
    CartStorage cartStorage = CartStorage();
    var cartBox = await CartStorage.openCartBox();
    var itemIndex = cartItems.indexWhere((element) =>
        element.mealId == cartItem.mealId &&
        element.mealName == cartItem.mealName);
    await cartStorage.deleteCartItem(cartBox, itemIndex);
    cartItems = [];
    cartItems = await cartStorage.getCartItems(cartBox);
   getTotalPrice();
    update(['order_item','cart_item']);
  }

  void getTotalPrice() {
    totalPrice.value = 0;
    cartItems.forEach((element) {
      totalItemsPrice.value += element.mealPrice * element.quantity;
    });
    totalDiscount.value = totalItemsPrice * 0.2;
    totalPrice = totalItemsPrice - totalDiscount.value + 2;
    if(cartItems.isEmpty){
      totalItemsPrice.value=0;
      totalPrice.value=0;
      totalDiscount.value=0;
    }

  }

  void incrementItemQuantity(RestMeals orderItem) {
    for (var item in cartItems) {
      if (item == orderItem) {
        orderItem.quantity += 1;
        break;
      }
    }
    getTotalPrice();
    updateOrderItem(orderItem);
    update(['order_item']);
  }

  Future<void> updateOrderItem(RestMeals orderItem) async {
    CartStorage cartStorage = CartStorage();
    final cartBox = await CartStorage.openCartBox();
    final itemIndex = cartItems.indexOf(orderItem);
    await cartStorage.updateCartItem(cartBox, itemIndex, orderItem);
  }

  void decrementItemQuantity(RestMeals orderItem) {
    if (orderItem.quantity == 1) {
      return;
    }
    for (var item in cartItems) {
      if (item == orderItem) {
        orderItem.quantity -= 1;
        break;
      }
    }
    getTotalPrice();
    updateOrderItem(orderItem);
    update(['order_item']);
  }

}
