// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animeNewsModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeNewsModelAdapter extends TypeAdapter<AnimeNewsModel> {
  @override
  final int typeId = 4;

  @override
  AnimeNewsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimeNewsModel(
      id: fields[0] as String,
      description: fields[3] as String,
      link: fields[5] as String,
      title: fields[1] as String,
      author: fields[2] as String,
      guid: fields[6] as String,
      pubDate: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AnimeNewsModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.pubDate)
      ..writeByte(5)
      ..write(obj.link)
      ..writeByte(6)
      ..write(obj.guid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeNewsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
