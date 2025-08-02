import 'package:json_annotation/json_annotation.dart';
import 'package:places_api/src/models/place_model.dart';

part 'place_response_model.g.dart';

@JsonSerializable()
class PlaceResponse {
  PlaceResponse({
    required this.query,
    required this.total,
    required this.places,
  });

  @JsonKey(name: 'query')
  final String query;

  @JsonKey(name: 'total')
  final int total;

  @JsonKey(name: 'results')
  final List<PlaceResult> places;

  factory PlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceResponseToJson(this);
}

@JsonSerializable()
class PlaceResult {
  PlaceResult({required this.relevanceScore, required this.place});

  @JsonKey(name: 'relevance_score')
  final double relevanceScore;

  @JsonKey(name: 'place')
  final Place place;

  factory PlaceResult.fromJson(Map<String, dynamic> json) =>
      _$PlaceResultFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceResultToJson(this);
}
