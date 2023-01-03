import 'package:freezed_annotation/freezed_annotation.dart';
part "detail.freezed.dart";
part "detail.g.dart";

@freezed
class Detail with _$Detail {
  const factory Detail({
    required bool adult,
    required String backdrop_path,
    required dynamic belongs_to_collection,
    required int budget,
    required List genres,
    required String homepage,
    required int id,
    required String imdb_id,
    required String original_language,
    required String original_title,
    required String overview,
    required double popularity,
    required String poster_path,
    required List<dynamic> production_companies,
    required List<dynamic> production_countries,
    required String release_date,
    required int revenue,
    required int runtime,
    required List<dynamic> spoken_languages,
    required String status,
    required String tagline,
    required String title,
    required bool video,
    required double vote_average,
    required int vote_count,
  }) = _Detail;

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
}
