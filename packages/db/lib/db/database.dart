import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'weather_dao.dart';
import 'weather_for_db.dart';

part 'database.g.dart';

@Database(version: 1, entities: [WeatherForDB])
abstract class AppDatabase extends FloorDatabase {
  WeatherDao get weatherDao;
}
