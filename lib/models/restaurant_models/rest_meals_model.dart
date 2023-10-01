import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'rest_meals_model.g.dart';

@HiveType(typeId: 1)
class RestMeals extends Equatable {
  @HiveField(0)
  String mealId;
  @HiveField(1)
  String mealName;
  @HiveField(2)
  double mealPrice;
  @HiveField(3)
  String mealDescription;
  @HiveField(4)
  String mealImage;
  @HiveField(5)
  bool inPopularMenu;
  @HiveField(6)
  String category;
  @HiveField(7)
  int quantity;
  RestMeals(
      {required this.mealId,
      required this.mealName,
      required this.mealPrice,
      required this.mealDescription,
      required this.mealImage,
      required this.inPopularMenu,
      required this.category,
      this.quantity = 1});

  RestMeals.fromJson(Map<String, dynamic> json)
      : mealId = json['mealId'],
        mealName = json['mealName'],
        mealPrice = json['mealPrice'],
        mealDescription = json['mealDescription'],
        mealImage = json['mealImage'],
        inPopularMenu = json['inPopularMenu'],
        category = json['category'],
        quantity = 1;

  RestMeals.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : mealId = snapshot.id,
        mealName = snapshot['mealName'],
        mealPrice = snapshot['mealPrice'],
        mealDescription = snapshot['mealDescription'],
        mealImage = snapshot['mealImage'],
        inPopularMenu = snapshot['inPopularMenu'],
        category = snapshot['category'],
        quantity = 1;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mealId'] = this.mealId;
    data['mealName'] = this.mealName;
    data['mealPrice'] = this.mealPrice;
    data['mealDescription'] = this.mealDescription;
    data['mealImage'] = this.mealImage;
    data['inPopularMenu'] = this.inPopularMenu;
    data['category'] = this.category;
    return data;
  }

  @override
  String toString() {
    return 'RestMeals{mealId: $mealId, mealName: $mealName, mealPrice: $mealPrice, mealDescription: $mealDescription, mealImage: $mealImage, inPopularMenu: $inPopularMenu, category: $category, quantity:$quantity}';
  }

  @override
  List<Object> get props => [
        mealName,
        mealId,
        mealImage,
        category,
        mealPrice,
        inPopularMenu,
        mealDescription,
      ];
}
