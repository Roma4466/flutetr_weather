import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'datetime_conventer.dart';
import 'weather_dao.dart';
import 'weather_for_db.dart';

part 'database.g.dart';

@Database(version: 1, entities: [WeatherFromDB])
abstract class AppDatabase extends FloorDatabase {
  WeatherDao get weatherDao;
}
