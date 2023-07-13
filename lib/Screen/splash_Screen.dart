import 'dart:async';

import 'package:flutter/material.dart';
import 'package:odiacalendar2023/Screen/index.dart';

class splash_Screen extends StatefulWidget {
  const splash_Screen({super.key});

  @override
  State<splash_Screen> createState() => _splash_ScreenState();
}

class _splash_ScreenState extends State<splash_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
     Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainPage(index: 0,)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/icon/odia-calendar-2023.png",
        height: 50,
        width: 50,
      ),
    );
  }
}
