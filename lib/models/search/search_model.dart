import 'package:interstellar_labs/models/all_movies/all_movies.dart';

class SearchResponseModel {
  int? page;
  List<AllMovies>? results;
  int? totalPages;
  int? totalResults;

  SearchResponseModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  SearchResponseModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <AllMovies>[];
      json['results'].forEach((v) {
        results!.add(AllMovies.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
