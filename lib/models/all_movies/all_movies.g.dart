// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_movies.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllMoviesAdapter extends TypeAdapter<AllMovies> {
  @override
  final int typeId = 0;

  @override
  AllMovies read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllMovies();
  }

  @override
  void write(BinaryWriter writer, AllMovies obj) {
    writer..writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllMoviesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
