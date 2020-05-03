import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
abstract class WeatherEvent extends Equatable {
  WeatherEvent();
}

// ignore: must_be_immutable
class FetchWeatherEvent extends WeatherEvent {
  final String sehiradi;

  // ignore: non_constant_identifier_names
  FetchWeatherEvent({@required this.sehiradi});

  @override
  List<Object> get props => [sehiradi];
}

class RefleshWeatherEvent extends WeatherEvent{
  final String sehiradi;
  RefleshWeatherEvent({@required this.sehiradi});

  @override
  // TODO: implement props
  List<Object> get props => [sehiradi];

}
