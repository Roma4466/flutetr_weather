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

  Future<void> createWeather(WeatherFromDB weather) async {
    await _database!.weatherDao.insertWeather(weather);
  }

  Stream<List<WeatherFromDB>> getWeathers() =>
      _database!.weatherDao.getAllWeathers();
}
