import 'package:food_delivery_green/models/restaurant_models/rest_meals_model.dart';
import 'package:hive/hive.dart';

class CartStorage {
  static const String cartBox = 'cart_box';
  static Future<Box> openCartBox() async {
    final box = await Hive.openBox<RestMeals>(cartBox);
    return box;
  }

  Future<List<RestMeals>> getCartItems(Box box) async {
    print(box.keys);
    return box.values.toList().cast<RestMeals>();
  }

  Future<void> addCartItem(Box box, RestMeals cartItem) async {
    await box.add(cartItem);
    print(box.length);
  }

  Future<void> deleteCartItem(Box box, int itemIndex) async {
    await box.deleteAt(itemIndex);
    print(box.length);
  }
  Future<void> updateCartItem(Box box, int itemIndex,RestMeals meal) async {
    await box.putAt(itemIndex, meal);

  }
}
