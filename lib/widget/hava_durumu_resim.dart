import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast/bloc/weather/bloc.dart';

class HavaDurumuResimWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final weatherbloc = BlocProvider.of<WeatherBloc>(context);

    return BlocBuilder(
        bloc: weatherbloc,
        builder: (context, state) => Column(
              children: <Widget>[
                Text(
                  (state as WeatherLoadedState)
                      .weather
                      .consolidatedWeather[0]
                      .theTemp
                      .floor()
                      .toString()+"°C",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20,),
                Image.network(
                  "https://www.metaweather.com/static/img/weather/png/" +
                      (state as WeatherLoadedState)
                          .weather
                          .consolidatedWeather[0]
                          .weatherStateAbbr +
                      ".png",
                  width: 150,
                  height: 150,
                )
              ],
            ));
  }
}
