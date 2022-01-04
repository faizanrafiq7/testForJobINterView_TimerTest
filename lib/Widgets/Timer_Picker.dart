import 'package:chair_app/providers/homeScreenDataProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class TimerPicker extends StatelessWidget {
  final String widgetNo;
  const TimerPicker({this.widgetNo});

  @override
  Widget build(BuildContext context) {
    var provider1 = Provider.of<HomeDataProvider>(context, listen: true);
    var provider0 = context.read<HomeDataProvider>();
    return Container(
      height: screenHeight * 0.35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: CupertinoTimerPicker(
        mode: CupertinoTimerPickerMode.ms,
        minuteInterval: 1,
        secondInterval: 1,
        initialTimerDuration: widgetNo == '2'
            ? provider1.timerTrainingInterview == null
                ? Duration(seconds: 0)
                : provider1.timerTrainingInterview
            : provider1.timerInterval == null
                ? Duration(seconds: 0)
                : provider1.timerInterval,
        onTimerDurationChanged: (Duration time) {
          if (widgetNo == '2') {
            provider0.timerTrainingInterviewChange(time);
          } else {
            provider0.timerIntervalChange(time);
          }
        },
      ),
    );
  }
}
