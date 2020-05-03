import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast/bloc/tema/bloc.dart';
import 'package:weatherforecast/bloc/weather/bloc.dart';
import 'package:weatherforecast/locator.dart';
import 'widget/weather_app.dart';

void main() {
  setupLocator();
  runApp(BlocProvider<TemaBloc>(
    child: MyApp(),
    create: (context) => TemaBloc(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<TemaBloc>(context),
      builder: (context,state)=> MaterialApp(
          title: "Weather APP",
          debugShowCheckedModeBanner: false,
          theme: (state as UygulamaTemasi).tema,
          home: BlocProvider<WeatherBloc>(
            child: WeatherApp(),
            create: (BuildContext context) => WeatherBloc(),
          )),
    );
  }
}
