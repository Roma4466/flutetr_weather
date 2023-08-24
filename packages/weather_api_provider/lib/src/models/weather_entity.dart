import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_entity.g.dart';

/// Represents the response received from the OpenWeather API.
@JsonSerializable()
class OpenWeatherResponse extends Equatable {
  /// Coordinates of the location.
  final Coord coord;

  /// Weather information.
  final List<Weather> weather;

  /// Data source.
  final String base;

  /// Main weather data.
  final Main main;

  /// Visibility in meters.
  final int visibility;

  /// Wind information.
  final Wind wind;

  /// Cloud information.
  final Clouds clouds;

  /// Time of data calculation, UNIX, UTC.
  final int dt;

  /// System information.
  final Sys sys;

  /// City ID.
  final int id;

  /// Name of the city.
  @JsonKey(name: 'name')
  final String cityName;

  /// HTTP response code.
  final int cod;

  OpenWeatherResponse({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.id,
    required this.cityName,
    required this.cod,
  });

  factory OpenWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$OpenWeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OpenWeatherResponseToJson(this);

  @override
  List<Object?> get props => [
        coord,
        weather,
        base,
        main,
        visibility,
        wind,
        clouds,
        dt,
        sys,
        id,
        cityName,
        cod,
      ];

  @override
  String toString() => 'OpenWeatherResponse(coord: $coord, weather: $weather, '
      'base: $base, main: $main, visibility: $visibility, wind: $wind, '
      'clouds: $clouds, dt: $dt, sys: $sys, id: $id, name: $cityName, cod: $cod)';
}

@JsonSerializable()
class Weather extends Equatable {
  /// Weather condition ID.
  final int id;

  /// Main weather parameter.
  final String main;

  /// Detailed weather description.
  final String description;

  /// Weather icon ID.
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  List<Object?> get props => [id, main, description, icon];

  @override
  String toString() =>
      'Weather(id: $id, main: $main, description: $description, icon: $icon)';
}

@JsonSerializable()
class Clouds extends Equatable {
  /// Cloudiness percentage.
  final int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsToJson(this);

  @override
  List<Object?> get props => [all];

  @override
  String toString() => 'Clouds(all: $all)';
}

@JsonSerializable()
class Coord extends Equatable {
  /// Longitude coordinate.
  final double lon;

  /// Latitude coordinate.
  final double lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  Map<String, dynamic> toJson() => _$CoordToJson(this);

  @override
  List<Object?> get props => [lon, lat];

  @override
  String toString() => 'Coord(lon: $lon, lat: $lat)';
}

@JsonSerializable()
class Main extends Equatable {
  /// Temperature in Kelvin.
  final double temp;

  /// Temperature feels like in Kelvin.
  @JsonKey(name: 'feels_like')
  final double feelsLike;

  /// Minimum temperature in Kelvin.
  @JsonKey(name: 'temp_min')
  final double tempMin;

  /// Maximum temperature in Kelvin.
  @JsonKey(name: 'temp_max')
  final double tempMax;

  /// Atmospheric pressure in hPa.
  final int pressure;

  /// Humidity percentage.
  final int humidity;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);

  @override
  List<Object?> get props =>
      [temp, feelsLike, tempMin, tempMax, pressure, humidity];

  @override
  String toString() =>
      'Main(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, '
      'tempMax: $tempMax, pressure: $pressure, humidity: $humidity)';
}

@JsonSerializable()
class Sys extends Equatable {
  /// System parameter.
  final int? type;

  /// System ID.
  final int? id;

  /// Country code (2-character).
  final String? country;

  /// Sunrise time in UNIX, UTC.
  final int sunrise;

  /// Sunset time in UNIX, UTC.
  final int sunset;

  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);

  @override
  List<Object?> get props => [type, id, country, sunrise, sunset];

  @override
  String toString() => 'Sys(type: $type, id: $id, '
      'country: $country, sunrise: $sunrise, sunset: $sunset)';
}

@JsonSerializable()
class Wind extends Equatable {
  /// Wind speed in meters per second.
  final double speed;

  /// Wind direction in degrees.
  final double? deg;

  /// Wind gust speed in meters per second.
  final double? gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);

  @override
  List<Object?> get props => [speed, deg, gust];

  @override
  String toString() => 'Wind(speed: $speed, deg: $deg, gust: $gust)';
}
