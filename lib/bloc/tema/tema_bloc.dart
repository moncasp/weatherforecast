import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import './bloc.dart';

class TemaBloc extends Bloc<TemaEvent, TemaState> {
  @override
  TemaState get initialState =>
      UygulamaTemasi(tema: ThemeData.light(), color: Colors.blue);

  @override
  Stream<TemaState> mapEventToState(TemaEvent event) async* {
    // TODO: Add Logic
    UygulamaTemasi uygulamaTemasi;
    if (event is TemaDegistirEvent) {
      switch (event.havaDurumukisaltmasi) {
        case 'sn':
        case 'sl':
        case 'h':
        case 't':
        case 'hc':
          uygulamaTemasi = UygulamaTemasi(
              tema: ThemeData(primaryColor: Colors.blueAccent),
              color: Colors.grey);
          break;
        case 'hr':
        case 'lr':
        case 's':
          uygulamaTemasi = UygulamaTemasi(
              tema: ThemeData(primaryColor: Colors.indigoAccent),
              color: Colors.indigo);
          break;
        case 'c':
        case 'lc':
          uygulamaTemasi = UygulamaTemasi(
              tema: ThemeData(primaryColor: Colors.orangeAccent),
              color: Colors.yellow);
          break;
      }
      yield uygulamaTemasi;
    }
  }
}
