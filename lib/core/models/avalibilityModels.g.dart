// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avalibilityModels.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeAvalibilityAdapter extends TypeAdapter<AnimeAvalibility> {
  @override
  final int typeId = 2;

  @override
  AnimeAvalibility read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimeAvalibility(
      category: fields[1] as String,
      channel: fields[0] as String,
      link: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AnimeAvalibility obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.channel)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.link);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeAvalibilityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
