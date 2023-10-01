import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_green/models/restaurant_models/rest_meals_model.dart';
import 'package:hive/hive.dart';
part 'restaurant_model.g.dart';

@HiveType(typeId: 0)
class RestaurantModel {
  @HiveField(0)
  String restId;
  @HiveField(1)
  String restBranch;
  @HiveField(2)
  String restName;
  @HiveField(3)
  String restLogo;
  @HiveField(4)
  List<RestMeals>? restMeals;

  RestaurantModel({
    required this.restId,
    required this.restBranch,
    required this.restName,
    required this.restLogo,
    required this.restMeals,
  });

  RestaurantModel.fromJson(Map<String, dynamic> json)
      : restId = json['restId'],
        restBranch = json['restBranch'],
        restName = json['restName'],
        restLogo = json['restLogo'],
        restMeals = (json['restMeals'] as List<dynamic>)
            .map((e) => RestMeals.fromJson(e as Map<String, dynamic>))
            .toList();
  RestaurantModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : restId = snapshot.id,
        restBranch = snapshot['restBranch'],
        restName = snapshot['restName'],
        restLogo = snapshot['restLogo'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restId'] = this.restId;
    data['restBranch'] = this.restBranch;
    data['restName'] = this.restName;
    data['restLogo'] = this.restLogo;
    if (this.restMeals != null) {
      data['restMeals'] = this.restMeals!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'RestaurantModel{restId: $restId, restBranch: $restBranch, restName: $restName, restLogo: $restLogo, restMeals: $restMeals}';
  }
}

