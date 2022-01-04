import 'package:chair_app/Widgets/Button_Widget.dart';
import 'package:chair_app/providers/homeScreenDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class TimerScreen extends StatefulWidget {
  static const routeName = '/TimerScreen';
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int endTime;
  bool isRunning = false;
  CountdownController countdownController;

  initValues() {
    var provider = Provider.of<HomeDataProvider>(context, listen: true);
    endTime = DateTime.now().millisecondsSinceEpoch +
        1000 * provider.timerTrainingInterview.inSeconds;

    countdownController = CountdownController(
        duration: Duration(
            milliseconds: provider.timerTrainingInterview.inSeconds * 1000));
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    /// Initializing endTime, countdownController Values
    initValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 1,
            ),
            Countdown(
              countdownController: countdownController,
              builder: (_, timee) {
                if (timee == null) {
                  return Text('');
                }
                return Text(
                  '${(giveDuration(timee.inMilliseconds)).substring(0, 5)}',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: screenWidth * 0.2,
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget(
                      isRunning: isRunning,
                      whenPressed: () async {
                        if (!countdownController.isRunning) {
                          await countdownController.start();
                          isRunning = true;
                        } else {
                          await countdownController.stop();
                          isRunning = false;
                        }
                        setState(() {});
                      }),
                  ButtonWidget(
                    btnType: 'stop',
                    isRunning: isRunning,
                    whenPressed: () async {
                      isRunning = false;
                      await countdownController.stop();
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
