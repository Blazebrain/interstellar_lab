import 'package:hive/hive.dart';
import 'package:interstellar_labs/utils/hive_type_id_keys/hive_type_id_keys.dart';
part 'genre_model.g.dart';

class GenreResponseModel {
  List<Genres>? genres;

  GenreResponseModel({this.genres});

  GenreResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: HiveTypeIdKeys.genreTypeIdKey)
class Genres {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
