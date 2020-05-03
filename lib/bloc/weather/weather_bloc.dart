import 'dart:async';
import 'package:weatherforecast/data/weather_repository.dart';
import 'package:weatherforecast/locator.dart';
import 'package:weatherforecast/models/weather/weather.dart';
import 'package:bloc/bloc.dart';
import 'bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
final WeatherRepository weatherRepository= locator<WeatherRepository>();

  @override
  WeatherState get initialState => InitialWeatherState();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    // TODO: Add Logic
    if (event is FetchWeatherEvent) {
      yield WeatherLoadingState();
      try {
        //bringing codes weather state
       final Weather getirilenWeather= await weatherRepository.getWeather(event.sehiradi);

        yield WeatherLoadedState(weather: getirilenWeather);
      } catch (_) {
        yield WeatherErrorState();
      }
    }else if (event is RefleshWeatherEvent) {
      yield WeatherLoadingState();
      try {
        //bringing codes weather state
        final Weather getirilenWeather= await weatherRepository.getWeather(event.sehiradi);

        yield WeatherLoadedState(weather: getirilenWeather);
      } catch (_) {
        yield state;
      }
    }


  }
}
