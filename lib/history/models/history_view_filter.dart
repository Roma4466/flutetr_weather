import 'package:flutter_weather/weather_pages/weather/models/models.dart';

enum HistoryViewFilter { byDate, byDateDesc, byName, byNameDesc }

extension TodosViewFilterX on HistoryViewFilter {
  List<Weather> apply(List<Weather> weathers) {
    switch (this) {
      case HistoryViewFilter.byDate:
        return List.from(weathers)
          ..sort((a, b) => b.lastUpdated.compareTo(
                a.lastUpdated,
              ));
      case HistoryViewFilter.byDateDesc:
        return List.from(weathers)
          ..sort((a, b) => a.lastUpdated.compareTo(
                b.lastUpdated,
              ));
      case HistoryViewFilter.byName:
        return List.from(weathers)
          ..sort((a, b) => a.location.compareTo(b.location));
      case HistoryViewFilter.byNameDesc:
        return List.from(weathers)
          ..sort((a, b) => b.location.compareTo(a.location));
    }
  }
}
