import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TemaState extends Equatable {
  const TemaState();
}

class UygulamaTemasi extends TemaState{
  final ThemeData tema;
  final MaterialColor color;
  UygulamaTemasi({@required this.tema,@required this.color});
  @override
  // TODO: implement props
  List<Object> get props => [tema,color];

}
