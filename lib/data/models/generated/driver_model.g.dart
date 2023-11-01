// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../driver_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DriverModelAdapter extends TypeAdapter<DriverModel> {
  @override
  final int typeId = 1;

  @override
  DriverModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DriverModel(
      name: fields[0] as String,
      code: fields[1] as String,
      mobile: fields[2] as String,
      nationalId: fields[3] as String,
      gander: fields[4] as String,
      image: fields[5] as String,
      type: fields[6] as String,
      token: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DriverModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.mobile)
      ..writeByte(3)
      ..write(obj.nationalId)
      ..writeByte(4)
      ..write(obj.gander)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DriverModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
