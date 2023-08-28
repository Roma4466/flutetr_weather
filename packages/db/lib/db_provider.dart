import 'dart:async';

import 'db/db.dart';

class DbProvider {
  late AppDatabase _database;
  WeatherFromDB? lastDeleted;

  static final DbProvider _shared = DbProvider._sharedInstance();

  DbProvider._sharedInstance();

  factory DbProvider() => _shared;

  Future<void> initializeDatabase() async {
    _database =
        await $FloorAppDatabase.databaseBuilder('edmt_database.db').build();
  }

  Future<void> createWeather(WeatherFromDB weather) =>
      _database.weatherDao.insertWeather(weather);

  Stream<List<WeatherFromDB>> getWeathers() =>
      _database.weatherDao.getAllWeathers();

  Future<void> deleteWeather(String id) async {
    lastDeleted = await _database.weatherDao.getWeatherById(id);
    await _database.weatherDao.deleteWeatherById(id);
  }

  Future<void> undoDeletion(String id) async {
    assert(
        lastDeleted != null && lastDeleted!.id == id, 'Cannot undo deletion');
    _database.weatherDao.insertWeather(lastDeleted!);
  }

  Future<void> deleteAll() => _database.weatherDao.deleteAll();
}
