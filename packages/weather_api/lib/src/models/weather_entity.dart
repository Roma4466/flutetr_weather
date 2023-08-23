import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_entity.g.dart';

/// Represents the response received from the OpenWeather API.
@JsonSerializable()
class OpenWeatherResponse extends Equatable {
  @JsonKey(name: 'coord')
  final Coord coord;

  @JsonKey(name: 'weather')
  final List<Weather> weather;

  @JsonKey(name: 'base')
  final String? base;

  @JsonKey(name: 'main')
  final Main main;

  @JsonKey(name: 'visibility')
  final int visibility;

  @JsonKey(name: 'wind')
  final Wind wind;

  @JsonKey(name: 'clouds')
  final Clouds clouds;

  @JsonKey(name: 'dt')
  final int dt;

  @JsonKey(name: 'sys')
  final Sys sys;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'cod')
  final int cod;

  OpenWeatherResponse({
    required this.coord,
    required this.weather,
    this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.id,
    this.name,
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
    name,
    cod,
  ];

  @override
  String toString() => 'OpenWeatherResponse(coord: $coord, weather: $weather, '
      'base: $base, main: $main, visibility: $visibility, wind: $wind, '
      'clouds: $clouds, dt: $dt, sys: $sys, id: $id, name: $name, cod: $cod)';
}

/// Represents weather information.
@JsonSerializable()
class Weather extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'main')
  final String? main;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'icon')
  final String? icon;

  Weather({
    required this.id,
    this.main,
    this.description,
    this.icon,
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

/// Represents cloud information.
@JsonSerializable()
class Clouds extends Equatable {
  @JsonKey(name: 'all')
  final int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsToJson(this);

  @override
  List<Object?> get props => [all];

  @override
  String toString() => 'Clouds(all: $all)';
}

/// Represents geographic coordinates.
@JsonSerializable()
class Coord extends Equatable {
  @JsonKey(name: 'lon')
  final double lon;

  @JsonKey(name: 'lat')
  final double lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  Map<String, dynamic> toJson() => _$CoordToJson(this);

  @override
  List<Object?> get props => [lon, lat];

  @override
  String toString() => 'Coord(lon: $lon, lat: $lat)';
}

/// Represents main weather data.
@JsonSerializable()
class Main extends Equatable {
  @JsonKey(name: 'temp')
  final double temp;

  @JsonKey(name: 'pressure')
  final int pressure;

  @JsonKey(name: 'humidity')
  final int humidity;

  @JsonKey(name: 'temp_min')
  final double tempMin;

  @JsonKey(name: 'temp_max')
  final double tempMax;

  @JsonKey(name: 'feels_like')
  final double feelsLike;

  Main({
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.tempMin,
    required this.tempMax,
    required this.feelsLike,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);

  @override
  List<Object?> get props => [temp, pressure, humidity, tempMin, tempMax, feelsLike];

  @override
  String toString() =>
      'Main(temp: $temp, pressure: $pressure, humidity: $humidity, '
          'tempMin: $tempMin, tempMax: $tempMax, feelsLike: $feelsLike)';
}

/// Represents system information.
@JsonSerializable()
class Sys extends Equatable {
  @JsonKey(name: 'type')
  final int type;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'message')
  final double message;

  @JsonKey(name: 'country')
  final String? country;

  @JsonKey(name: 'sunrise')
  final int sunrise;

  @JsonKey(name: 'sunset')
  final int sunset;

  Sys({
    required this.type,
    required this.id,
    required this.message,
    this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);

  @override
  List<Object?> get props => [type, id, message, country, sunrise, sunset];

  @override
  String toString() => 'Sys(type: $type, id: $id, message: $message, '
      'country: $country, sunrise: $sunrise, sunset: $sunset)';
}

/// Represents wind information.
@JsonSerializable()
class Wind extends Equatable {
  @JsonKey(name: 'speed')
  final double speed;

  @JsonKey(name: 'deg')
  final double deg;

  Wind({required this.speed, required this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);

  @override
  List<Object?> get props => [speed, deg];

  @override
  String toString() => 'Wind(speed: $speed, deg: $deg)';
}
