// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RestaurantModelAdapter extends TypeAdapter<RestaurantModel> {
  @override
  final int typeId = 0;

  @override
  RestaurantModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RestaurantModel(
      restId: fields[0] as String,
      restBranch: fields[1] as String,
      restName: fields[2] as String,
      restLogo: fields[3] as String,
      restMeals: (fields[4] as List?)?.cast<RestMeals>(),
    );
  }

  @override
  void write(BinaryWriter writer, RestaurantModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.restId)
      ..writeByte(1)
      ..write(obj.restBranch)
      ..writeByte(2)
      ..write(obj.restName)
      ..writeByte(3)
      ..write(obj.restLogo)
      ..writeByte(4)
      ..write(obj.restMeals);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RestaurantModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
