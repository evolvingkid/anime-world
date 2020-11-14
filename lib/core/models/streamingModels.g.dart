// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streamingModels.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StreamingModelsAdapter extends TypeAdapter<StreamingModels> {
  @override
  final int typeId = 2;

  @override
  StreamingModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StreamingModels(
      site: fields[2] as String,
      title: fields[0] as String,
      tumbline: fields[3] as String,
      url: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StreamingModels obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.site)
      ..writeByte(3)
      ..write(obj.tumbline);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StreamingModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
