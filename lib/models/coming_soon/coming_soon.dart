import 'package:interstellar_labs/models/all_movies/all_movies.dart';
import 'package:interstellar_labs/models/dates/dates_model.dart';

class ComingSoonResponseModel {
  Dates? dates;
  int? page;
  List<AllMovies>? results;
  int? totalPages;
  int? totalResults;

  ComingSoonResponseModel({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  ComingSoonResponseModel.fromJson(Map<String, dynamic> json) {
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
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
    if (dates != null) {
      data['dates'] = dates!.toJson();
    }
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
