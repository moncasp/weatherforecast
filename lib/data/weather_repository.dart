import 'package:weatherforecast/data/weather_api_client.dart';
import 'package:weatherforecast/locator.dart';
import 'package:weatherforecast/models/weather/weather.dart';

class WeatherRepository {

  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<Weather> getWeather(String sehir) async {
    final int sehirID = await weatherApiClient.getLocationID(sehir);
    return await weatherApiClient.getWeather(sehirID);
  }

}
