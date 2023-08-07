import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ColorEvent { red, green }

class ColorCubit extends Cubit<Color> {
  ColorCubit() : super(Colors.red);

  void changeColor(ColorEvent event) {
    emit(event == ColorEvent.red ? Colors.red : Colors.green);
  }
}