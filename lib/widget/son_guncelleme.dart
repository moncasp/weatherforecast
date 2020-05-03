import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast/bloc/weather/bloc.dart';

class SonGuncellemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final _weather = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
        bloc: _weather,
        builder: (context, state) {

          var yeniTarih=(state as WeatherLoadedState).weather.time.toLocal();

          return Text("Son Güncelleme: "+TimeOfDay.fromDateTime(yeniTarih).format(context),
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20));
        });
  }
}
//(state as WeatherLoadedState).weather.time.toLocal()
