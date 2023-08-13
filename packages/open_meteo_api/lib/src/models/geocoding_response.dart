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
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final double elevation;
  final String feature_code;
  final String country_code;
  final int admin1_id;
  final int admin2_id;
  final int admin3_id;
  final String timezone;
  final int population;
  final List<String> postcodes;
  final int country_id;
  final String country;
  final String admin1;
  final String admin2;
  final String admin3;

  GeocodingResult({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.feature_code,
    required this.country_code,
    required this.admin1_id,
    required this.admin2_id,
    required this.admin3_id,
    required this.timezone,
    required this.population,
    required this.postcodes,
    required this.country_id,
    required this.country,
    required this.admin1,
    required this.admin2,
    required this.admin3,
  });

  factory GeocodingResult.fromJson(Map<String, dynamic> json) =>
      _$GeocodingResultFromJson(json);

  @override
  String toString() {
    return 'GeocodingResult{id: $id, name: $name, latitude: $latitude, longitude: $longitude, elevation: $elevation, '
        'feature_code: $feature_code, country_code: $country_code, admin1_id: $admin1_id, admin2_id: $admin2_id, '
        'admin3_id: $admin3_id, timezone: $timezone, population: $population, postcodes: $postcodes, '
        'country_id: $country_id, country: $country, admin1: $admin1, admin2: $admin2, admin3: $admin3}';
  }
}
