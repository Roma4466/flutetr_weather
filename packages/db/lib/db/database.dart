import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';

import 'weather_for_db.dart';
import 'weather_dao.dart';

part 'database.g.dart';

@Database(version: 1, entities: [WeatherForDB])
abstract class AppDatabase extends FloorDatabase {
  WeatherDao get weatherDao;
}
