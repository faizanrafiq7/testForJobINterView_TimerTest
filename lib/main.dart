import 'package:chair_app/providers/homeScreenDataProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/Home_Screen.dart';
import 'Screens/Timer_Screen.dart';

void main() {
  runApp(ChangeNotifierProvider<HomeDataProvider>(
      create: (BuildContext context) => HomeDataProvider(),
      lazy: false,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      TimerScreen.routeName: (ctx) => TimerScreen(),
    }, home: Home());
  }
}
