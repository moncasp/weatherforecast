import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast/bloc/weather/bloc.dart';

class MaxveMinSicaklikWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // ignore: close_sinks
    final weatherbloc = BlocProvider.of<WeatherBloc>(context);

    return BlocBuilder(
      bloc: weatherbloc,
      builder: (context,state)=>Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
      Text("Maksimum: "+(state as WeatherLoadedState)
          .weather
          .consolidatedWeather[0]
          .maxTemp
          .floor()
          .toString()+"°C",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),
          Text("Minumum: "+(state as WeatherLoadedState)
              .weather
              .consolidatedWeather[0]
              .minTemp
              .floor()
              .toString()+"°C",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20))
        ],
      ),
    );
  }
}
