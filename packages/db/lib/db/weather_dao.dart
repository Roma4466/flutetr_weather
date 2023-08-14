import 'package:db/db/weather_for_db.dart';
import 'package:floor/floor.dart';

@dao
abstract class WeatherDao {
  @Query('SELECT * FROM WeatherForDB')
  Stream<List<WeatherForDB>> getAllWeathers();

  @Query('SELECT * FROM WeatherForDB')
  Future<List<WeatherForDB>> getAllWeathersInList();

  @Query('SELECT * FROM WeatherForDB WHERE id = :id')
  Future<WeatherForDB?> getWeatherById(int id);

  @Query('DELETE FROM WeatherForDB')
  Future<void> deleteAll();

  @insert
  Future<void> insertWeather(WeatherForDB weather);

  @update
  Future<void> updateWeather(WeatherForDB weather);

  @delete
  Future<void> deleteWeather(WeatherForDB weather);
}
