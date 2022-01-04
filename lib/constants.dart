import 'package:flutter/material.dart';

MediaQueryData mediaQuery;
var screenHeight;
var screenWidth;

navN(ctx, route) {
  Navigator.push(
      ctx, MaterialPageRoute(builder: (BuildContext context) => route));
}

String giveDuration(int abc) {
  Duration duration = new Duration(
      days: 0, hours: 0, minutes: 0, seconds: 0, milliseconds: abc);
  print(duration);

  String milliSeconds = duration.toString().substring(8, 10);
  String seconds = duration.toString().substring(5, 7);
  String minutes = duration.toString().substring(2, 4);
  String finalDuration = '$minutes:$seconds:$milliSeconds';
  print(finalDuration);
  return (finalDuration);
}
