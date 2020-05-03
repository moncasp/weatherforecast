import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class TemaEvent extends Equatable {
  const TemaEvent();
}

class TemaDegistirEvent extends TemaEvent {
  final String havaDurumukisaltmasi;

  TemaDegistirEvent({@required this.havaDurumukisaltmasi});

  @override
  // TODO: implement props
  List<Object> get props => [havaDurumukisaltmasi];
}
