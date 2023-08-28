enum WeatherCondition {
  clear,
  rainy,
  cloudy,
  snowy,
  thunder,
  drizzle,
  mist,
  unknown;

  bool ifThereIsAnimateForIt() {
    return this == WeatherCondition.clear ||
        this == WeatherCondition.cloudy ||
        this == WeatherCondition.snowy ||
        this == WeatherCondition.rainy ||
        this == WeatherCondition.thunder;
  }
}
