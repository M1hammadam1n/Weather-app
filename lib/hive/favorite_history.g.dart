// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteHistoryAdapter extends TypeAdapter<FavoriteHistory> {
  @override
  final int typeId = 0;

  @override
  FavoriteHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteHistory(
      cityName: fields[0] as String,
      currentStatus: fields[1] as String,
      icon: fields[5] as String,
      windSpeed: fields[3] as String,
      temp: fields[4] as String,
      humidity: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteHistory obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.cityName)
      ..writeByte(1)
      ..write(obj.currentStatus)
      ..writeByte(2)
      ..write(obj.humidity)
      ..writeByte(3)
      ..write(obj.windSpeed)
      ..writeByte(4)
      ..write(obj.temp)
      ..writeByte(5)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
