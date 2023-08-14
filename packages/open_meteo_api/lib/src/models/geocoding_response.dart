import 'package:json_annotation/json_annotation.dart';

part 'geocoding_response.g.dart';

@JsonSerializable()
class GeocodingResponse {
  final List<GeocodingResult> results;
  final double generationtime_ms;

  GeocodingResponse({required this.results, required this.generationtime_ms});

  factory GeocodingResponse.fromJson(Map<String, dynamic> json) =>
      _$GeocodingResponseFromJson(json);
}

@JsonSerializable()
class GeocodingResult {
  final String name;
  final double latitude;
  final double longitude;

  GeocodingResult({
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory GeocodingResult.fromJson(Map<String, dynamic> json) =>
      _$GeocodingResultFromJson(json);

  @override
  String toString() {
    return 'GeocodingResult{ name: $name, latitude: $latitude, longitude: $longitude}';
  }
}
