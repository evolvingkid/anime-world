// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animeModels.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeModelsAdapter extends TypeAdapter<AnimeModels> {
  @override
  final int typeId = 1;

  @override
  AnimeModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimeModels(
      id: fields[2] as String,
      title: fields[4] as String,
      anilistid: fields[5] as int,
      animeAvalibility: (fields[18] as List)?.cast<AnimeAvalibility>(),
      averageScore: fields[13] as int,
      bannerImg: fields[16] as String,
      coverImg: fields[17] as String,
      description: fields[8] as String,
      duration: fields[11] as int,
      isAdult: fields[12] as bool,
      itemType: fields[3] as String,
      popularity: fields[14] as int,
      season: fields[9] as String,
      seasonYear: fields[10] as int,
      source: fields[15] as String,
      status: fields[7] as String,
      streamingData: (fields[1] as List)?.cast<StreamingModels>(),
      tags: (fields[0] as List)?.cast<String>(),
      type: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AnimeModels obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.tags)
      ..writeByte(1)
      ..write(obj.streamingData)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.itemType)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.anilistid)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.season)
      ..writeByte(10)
      ..write(obj.seasonYear)
      ..writeByte(11)
      ..write(obj.duration)
      ..writeByte(12)
      ..write(obj.isAdult)
      ..writeByte(13)
      ..write(obj.averageScore)
      ..writeByte(14)
      ..write(obj.popularity)
      ..writeByte(15)
      ..write(obj.source)
      ..writeByte(16)
      ..write(obj.bannerImg)
      ..writeByte(17)
      ..write(obj.coverImg)
      ..writeByte(18)
      ..write(obj.animeAvalibility);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
