import 'package:food_delivery_green/controllers/auth_controller.dart';
import 'package:food_delivery_green/controllers/cart_controller.dart';
import 'package:food_delivery_green/repos/auth_repository.dart';
import 'package:food_delivery_green/services/local_storage_service/cart_storage.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/restaurant_models/rest_meals_model.dart';
import '../models/restaurant_models/restaurant_model.dart';
class InitBindings extends Bindings {
  @override
  void dependencies() async {
    final shared = await SharedPreferences.getInstance();
    Get.lazyPut(() => shared);
    Get.lazyPut(() => AuthRepository());
    Get.put(
      AuthController(
        authRepository: Get.find(),
        sharedPreferences: Get.find(),
      ),
      permanent: true,
    );

    await Hive.initFlutter();

    Hive.registerAdapter(RestMealsAdapter());
    Hive.registerAdapter(RestaurantModelAdapter());
    CartStorage.openCartBox();
    Get.put(CartController(),permanent: true);
  }
}
