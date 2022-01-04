import 'package:flutter/material.dart';

import '../constants.dart';

class ButtonWidget extends StatelessWidget {
  final bool isRunning;
  final Function whenPressed;
  final String btnType;
  const ButtonWidget({
    this.isRunning,
    @required this.whenPressed,
    @required this.btnType,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.white,
      height: screenHeight * 0.08,
      minWidth: screenWidth * 0.35,
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Container(
          height: screenHeight * 0.08,
          width: screenWidth * 0.35,
          decoration: BoxDecoration(
            gradient: btnType == 'stop' && isRunning == false
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black54, Colors.white60])
                : LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white60, Colors.black54]),
          ),
          child: btnType == 'stop'
              ? Icon(Icons.stop)
              : Icon(isRunning ? Icons.pause : Icons.play_arrow)),
      onPressed: whenPressed,
    );
  }
}
