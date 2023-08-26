import 'package:db/db/weather_from_db.dart';
import 'package:floor/floor.dart';

@dao
abstract class WeatherDao {
  @Query('SELECT * FROM WeatherFromDB')
  Stream<List<WeatherFromDB>> getAllWeathers();

  @Query('SELECT * FROM WeatherFromDB')
  Future<List<WeatherFromDB>> getAllWeathersInList();

  @Query('SELECT * FROM WeatherFromDB WHERE id = :id')
  Future<WeatherFromDB?> getWeatherById(String id);

  @Query('DELETE FROM WeatherFromDB')
  Future<void> deleteAll();

  @insert
  Future<void> insertWeather(WeatherFromDB weather);

  @update
  Future<void> updateWeather(WeatherFromDB weather);

  @delete
  Future<void> deleteWeather(WeatherFromDB weather);

  @Query('DELETE FROM WeatherFromDB WHERE id = :id')
  Future<void> deleteWeatherById(String id);
}
