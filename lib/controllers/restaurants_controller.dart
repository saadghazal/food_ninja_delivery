import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_green/models/restaurant_models/restaurant_model.dart';
import 'package:food_delivery_green/refs/firebase_refs.dart';
import 'package:get/get.dart';

import '../models/restaurant_models/rest_meals_model.dart';

class RestaurantsController extends GetxController {
  final restaurantsList = <RestaurantModel>[].obs;
  final popularMeals = <RestMeals>[].obs;
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  @override
  void onReady() {
    loadRestaurants();
    super.onReady();
  }

  Future<void> loadRestaurants() async {
    try {
      _isLoading.value = true;
      QuerySnapshot<Map<String, dynamic>> restSnapshot = await restRf.get();
      restaurantsList.value = restSnapshot.docs
          .map((e) => RestaurantModel.fromSnapshot(e))
          .toList();
      for (var rest in restaurantsList) {
        QuerySnapshot<Map<String, dynamic>> restMeals =
            await restRf.doc(rest.restId).collection('meals').get();
        rest.restMeals =
            restMeals.docs.map((e) => RestMeals.fromSnapshot(e)).toList();
        for (var meal in rest.restMeals!) {
          if (meal.inPopularMenu == true) {
            popularMeals.add(meal);
          }
        }
      }

      _isLoading.value = false;
    } catch (e) {
      _isLoading.value = false;
      print(e);
    }
  }
}
