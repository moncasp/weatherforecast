import 'package:get_it/get_it.dart';
import 'package:weatherforecast/data/weather_api_client.dart';
import 'package:weatherforecast/data/weather_repository.dart';


GetIt locator = GetIt.asNewInstance();

void setupLocator() {
 locator.registerLazySingleton(()=>WeatherRepository());
 locator.registerLazySingleton(() => WeatherApiClient());
  
}