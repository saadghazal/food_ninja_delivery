import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_green/models/restaurant_models/restaurant_model.dart';
import 'package:food_delivery_green/refs/firebase_refs.dart';
import 'package:get/get.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    loadData();
    super.onReady();
  }

  Future<void> loadData() async {
    final assetsData = await DefaultAssetBundle.of(Get.context!)
        .loadString('AssetManifest.json');
    final Map<String, dynamic> assetsMap = json.decode(assetsData);
    final restsList = assetsMap.keys
        .where(
          (element) =>
              element.startsWith('assets/restaurants') &&
              element.contains('.json'),
        )
        .toList();
    List<RestaurantModel> restaurants = [];
    for (var rest in restsList) {
      String restListStringContent = await rootBundle.loadString(rest);
      restaurants.add(
        RestaurantModel.fromJson(
          jsonDecode(restListStringContent),
        ),
      );
    }
    final batch = fireStore.batch();
    for (var rest in restaurants) {
      batch.set(
        restRf.doc(rest.restId),
        {
          "restBranch": rest.restBranch,
          "restName": rest.restName,
          "restLogo": rest.restLogo,
        },
      );
      for (var meal in rest.restMeals!) {
        batch.set(
          restRf.doc(rest.restId).collection('meals').doc(meal.mealId),
          {
            "mealName": meal.mealName,
            "mealPrice": meal.mealPrice,
            "mealDescription": meal.mealDescription,
            "mealImage": meal.mealImage,
            "inPopularMenu": meal.inPopularMenu,
            "category": meal.category,
          },
        );
      }
    }
    batch.commit();
  }
}
