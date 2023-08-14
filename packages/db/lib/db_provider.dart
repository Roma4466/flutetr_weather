import 'dart:async';
import 'dart:math' show max;

import 'db/db.dart';

class DbProvider {
  AppDatabase? _database;

  static final DbProvider _shared = DbProvider._sharedInstance();

  DbProvider._sharedInstance();

  factory DbProvider() => _shared;

  Future<void> initializeDatabase() async {
    _database ??=
        await $FloorAppDatabase.databaseBuilder('edmt_database.db').build();
  }

  Future<WeatherForDB> createWeather(WeatherForDB weather) async {
    int maxID = 0;
    List<WeatherForDB> weathers =
        await _database!.weatherDao.getAllWeathersInList();
    for (final i in weathers) {
      maxID = max(i.id, maxID);
    }
    maxID++;
    final newWeather = weather.copyWith(id: maxID);
    await _database!.weatherDao.insertWeather(newWeather);
    return newWeather;
  }

  Stream<List<WeatherForDB>> getWeathers() =>
      _database!.weatherDao.getAllWeathers();
}
