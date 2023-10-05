part of 'weather_cubit.dart';

enum WeatherStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == WeatherStatus.initial;

  bool get isLoading => this == WeatherStatus.loading;

  bool get isSuccess => this == WeatherStatus.success;

  bool get isFailure => this == WeatherStatus.failure;
}

@JsonSerializable()
final class WeatherState extends Equatable {
  WeatherState({
    this.status = WeatherStatus.initial,
    this.temperatureUnits = TemperatureUnits.celsius,
    Weather? weather,
    this.errorMessage = 'Something went wrong',
  }) : weather = weather ?? Weather.empty;

  final WeatherStatus status;
  final Weather weather;
  final TemperatureUnits temperatureUnits;
  final String errorMessage;

  WeatherState copyWith(
      {WeatherStatus? status,
      TemperatureUnits? temperatureUnits,
      Weather? weather,
      String? errorMessage}) {
    return WeatherState(
        status: status ?? this.status,
        temperatureUnits: temperatureUnits ?? this.temperatureUnits,
        weather: weather ?? this.weather,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  Map<String, dynamic> toJson() => _$WeatherStateToJson(this);

  factory WeatherState.fromJson(Map<String, dynamic> json) =>
      _$WeatherStateFromJson(json);

  @override
  List<Object?> get props => [status, temperatureUnits, weather, errorMessage];
}
