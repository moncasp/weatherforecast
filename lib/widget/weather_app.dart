import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast/bloc/tema/bloc.dart';
import 'package:weatherforecast/bloc/weather/bloc.dart';
import 'package:weatherforecast/widget/gecisli_arkaplan_renk.dart';

import 'hava_durumu_resim.dart';
import 'location.dart';
import 'max_min_sicaklik.dart';
import 'sehir_sec.dart';
import 'son_guncelleme.dart';

// ignore: must_be_immutable
class WeatherApp extends StatelessWidget {
  String kullanicininSectigiSehir = "Ankara";
  Completer<void> _refleshCompleter=Completer<void>();

  @override
  Widget build(BuildContext context) {

    //ignore: close_sinks
    var _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              kullanicininSectigiSehir = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SehirSecWidget(),
                ),
              );
              if (kullanicininSectigiSehir != null) {
                _weatherBloc
                    .add(FetchWeatherEvent(sehiradi: kullanicininSectigiSehir));
              }
            },
          )
        ],
      ),
      body: Center(
        child: BlocBuilder(
          bloc: _weatherBloc,
          builder: (context, WeatherState state) {
            if (state is InitialWeatherState) {
              return Center(
                child: Text("Şehir seçiniz"),
              );
            }
            if(state is WeatherLoadingState){
              return Center(child: CircularProgressIndicator(),);
            }
            if(state is WeatherLoadedState){
              final getirilenWeather= state.weather;
              final havadurumuKisaltmasi= getirilenWeather.consolidatedWeather[0].weatherStateAbbr;
              kullanicininSectigiSehir=getirilenWeather.title;
              // ignore: close_sinks
              var _temabloc = BlocProvider.of<TemaBloc>(context);
              _temabloc.add(TemaDegistirEvent(havaDurumukisaltmasi:havadurumuKisaltmasi));
              _refleshCompleter.complete();
              _refleshCompleter=Completer();
            return BlocBuilder(
              bloc: _temabloc,
              builder: (context,state)=> GecisliRenkContainer(
                renk: (state as UygulamaTemasi).color,
                child: RefreshIndicator(
                  onRefresh: (){
                    _weatherBloc.add(RefleshWeatherEvent(sehiradi: kullanicininSectigiSehir));
                    return _refleshCompleter.future;
                  },
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: LocationWidget(
                                secilenSehir: getirilenWeather.title)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: SonGuncellemeWidget()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: HavaDurumuResimWidget()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: MaxveMinSicaklikWidget()),
                      ),
                    ],
                  ),
                ),
              ),
            );
            }
            if(state is WeatherErrorState){
              return Center(child: Text("Hata oluştu"),);
            }
            return Center(child: Text("tanımlanamayan bir sorun var"),);
          },
        ),
      ),
    );
  }
}
