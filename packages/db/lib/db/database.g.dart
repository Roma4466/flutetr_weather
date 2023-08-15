// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  WeatherDao? _weatherDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `WeatherForDB` (`id` TEXT PRIMARY KEY AUTOINCREMENT NOT NULL, `temperature` REAL NOT NULL, `windspeed` REAL NOT NULL, `winddirection` INTEGER NOT NULL, `weathercode` INTEGER NOT NULL, `is_day` INTEGER NOT NULL, `time` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WeatherDao get weatherDao {
    return _weatherDaoInstance ??= _$WeatherDao(database, changeListener);
  }
}

class _$WeatherDao extends WeatherDao {
  _$WeatherDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _weatherForDBInsertionAdapter = InsertionAdapter(
            database,
            'WeatherForDB',
            (WeatherForDB item) => <String, Object?>{
                  'id': item.id,
                  'temperature': item.temperature,
                  'windspeed': item.windspeed,
                  'winddirection': item.winddirection,
                  'weathercode': item.weathercode,
                  'is_day': item.is_day,
                  'time': item.time
                },
            changeListener),
        _weatherForDBUpdateAdapter = UpdateAdapter(
            database,
            'WeatherForDB',
            ['id'],
            (WeatherForDB item) => <String, Object?>{
                  'id': item.id,
                  'temperature': item.temperature,
                  'windspeed': item.windspeed,
                  'winddirection': item.winddirection,
                  'weathercode': item.weathercode,
                  'is_day': item.is_day,
                  'time': item.time
                },
            changeListener),
        _weatherForDBDeletionAdapter = DeletionAdapter(
            database,
            'WeatherForDB',
            ['id'],
            (WeatherForDB item) => <String, Object?>{
                  'id': item.id,
                  'temperature': item.temperature,
                  'windspeed': item.windspeed,
                  'winddirection': item.winddirection,
                  'weathercode': item.weathercode,
                  'is_day': item.is_day,
                  'time': item.time
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WeatherForDB> _weatherForDBInsertionAdapter;

  final UpdateAdapter<WeatherForDB> _weatherForDBUpdateAdapter;

  final DeletionAdapter<WeatherForDB> _weatherForDBDeletionAdapter;

  @override
  Stream<List<WeatherForDB>> getAllWeathers() {
    return _queryAdapter.queryListStream('SELECT * FROM WeatherForDB',
        mapper: (Map<String, Object?> row) => WeatherForDB(
            temperature: row['temperature'] as double,
            windspeed: row['windspeed'] as double,
            winddirection: row['winddirection'] as int,
            weathercode: row['weathercode'] as int,
            is_day: row['is_day'] as int,
            time: row['time'] as String),
        queryableName: 'WeatherForDB',
        isView: false);
  }

  @override
  Future<List<WeatherForDB>> getAllWeathersInList() async {
    return _queryAdapter.queryList('SELECT * FROM WeatherForDB',
        mapper: (Map<String, Object?> row) => WeatherForDB(
            temperature: row['temperature'] as double,
            windspeed: row['windspeed'] as double,
            winddirection: row['winddirection'] as int,
            weathercode: row['weathercode'] as int,
            is_day: row['is_day'] as int,
            time: row['time'] as String));
  }

  @override
  Future<WeatherForDB?> getWeatherById(int id) async {
    return _queryAdapter.query('SELECT * FROM WeatherForDB WHERE id = ?1',
        mapper: (Map<String, Object?> row) => WeatherForDB(
            temperature: row['temperature'] as double,
            windspeed: row['windspeed'] as double,
            winddirection: row['winddirection'] as int,
            weathercode: row['weathercode'] as int,
            is_day: row['is_day'] as int,
            time: row['time'] as String),
        arguments: [id]);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM WeatherForDB');
  }

  @override
  Future<void> insertWeather(WeatherForDB weather) async {
    await _weatherForDBInsertionAdapter.insert(
        weather, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateWeather(WeatherForDB weather) async {
    await _weatherForDBUpdateAdapter.update(weather, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteWeather(WeatherForDB weather) async {
    await _weatherForDBDeletionAdapter.delete(weather);
  }
}