// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_meals_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RestMealsAdapter extends TypeAdapter<RestMeals> {
  @override
  final int typeId = 1;

  @override
  RestMeals read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RestMeals(
      mealId: fields[0] as String,
      mealName: fields[1] as String,
      mealPrice: fields[2] as double,
      mealDescription: fields[3] as String,
      mealImage: fields[4] as String,
      inPopularMenu: fields[5] as bool,
      category: fields[6] as String,
      quantity: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RestMeals obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.mealId)
      ..writeByte(1)
      ..write(obj.mealName)
      ..writeByte(2)
      ..write(obj.mealPrice)
      ..writeByte(3)
      ..write(obj.mealDescription)
      ..writeByte(4)
      ..write(obj.mealImage)
      ..writeByte(5)
      ..write(obj.inPopularMenu)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RestMealsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
