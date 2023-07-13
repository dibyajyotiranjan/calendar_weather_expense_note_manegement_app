// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'package:flutter/material.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:odiacalendar2023/Screen/splash_Screen.dart';


void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ଓଡ଼ିଆ କାଲେଣ୍ଡର ୨୦୨୩',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const splash_Screen(),
    );
  }
}


