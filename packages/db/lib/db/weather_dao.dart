import 'package:db/db/weather_for_db.dart';
import 'package:floor/floor.dart';

@dao
abstract class WeatherDao {
  @Query('SELECT * FROM WeatherForDB')
  Stream<List<WeatherFromDB>> getAllWeathers();

  @Query('SELECT * FROM WeatherForDB')
  Future<List<WeatherFromDB>> getAllWeathersInList();

  @Query('SELECT * FROM WeatherForDB WHERE id = :id')
  Future<WeatherFromDB?> getWeatherById(int id);

  @Query('DELETE FROM WeatherForDB')
  Future<void> deleteAll();

  @insert
  Future<void> insertWeather(WeatherFromDB weather);

  @update
  Future<void> updateWeather(WeatherFromDB weather);

  @delete
  Future<void> deleteWeather(WeatherFromDB weather);
}
