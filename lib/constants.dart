import 'package:flutter/material.dart';

MediaQueryData mediaQuery;

var deviceHeight;
var deviceWidth;

navigatePush(ctx, route) {
  Navigator.push(
      ctx, MaterialPageRoute(builder: (BuildContext context) => route));
}
