// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_article.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveArticleAdapter extends TypeAdapter<HiveArticle> {
  @override
  final int typeId = 0;

  @override
  HiveArticle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveArticle(
      title: fields[0] as String?,
      content: fields[1] as String?,
      publishedAt: fields[2] as String?,
      url: fields[3] as String?,
      urlToImage: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveArticle obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.publishedAt)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.urlToImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveArticleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
