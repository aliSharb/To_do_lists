// ignore_for_file: use_key_in_widget_constructors

import 'package:bloc/bloc.dart';
import 'package:fapp/modules/home/home.dart';
import 'package:fapp/shared/blockObserver.dart';
import 'package:flutter/material.dart';

import 'layout/HomeLayout.dart';
import 'modules/bmi/BmiCalculator.dart';
import 'modules/counter/Counter_Screen.dart';
import 'modules/login/LoginScrean.dart';

import 'modules/massendger/massenger_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}
