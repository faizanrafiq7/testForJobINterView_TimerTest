import 'package:chair_app/Screens/Timer_Screen.dart';
import 'package:chair_app/Widgets/AlertDialogue.dart';
import 'package:chair_app/Widgets/Home_Screen_DataPicker.dart';
import 'package:chair_app/providers/homeScreenDataProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FocusNode focusNode = FocusNode();
  var providerListen0;
  var providerListen1;

  validate() {
    if (providerListen0.noTrainingInterviews == null ||
        providerListen0.noTrainingInterviews == '') {
      errorWid(context, 'Enter No of Total Training Interviews');
      return;
    } else if (providerListen0.timerTrainingInterview == null ||
        providerListen0 == '') {
      errorWid(context, 'Select Total Training reviews');
      return;
    } else if (providerListen0.timerInterval == null ||
        providerListen0.timerInterval == '') {
      errorWid(context, 'Select Interval Time');
      return;
    }
    return true;
  }

  initValues() {
    mediaQuery = MediaQuery.of(context);
    screenHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom;
    screenWidth = mediaQuery.size.width;
    providerListen0 = Provider.of<HomeDataProvider>(context, listen: false);
    providerListen1 = Provider.of<HomeDataProvider>(context, listen: true);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    /// getting screen height, width and Initializing providerListen0, providerListen1 Values
    initValues();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: screenHeight * 0.6,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HomeScreenDataPicker(
                whichNo: '1',
                focusNode: focusNode,
                key: ValueKey('1'),
              ),
              HomeScreenDataPicker(
                whichNo: '2',
                focusNode: focusNode,
                key: ValueKey('2'),
              ),
              HomeScreenDataPicker(
                whichNo: '3',
                focusNode: focusNode,
                key: ValueKey('3'),
              ),
              MaterialButton(
                color: Colors.white70,
                height: screenHeight * 0.07,
                minWidth: screenWidth * 0.1,
                onPressed: () {
                  if (validate() == true) {
                    Navigator.pushNamed(context, TimerScreen.routeName);
                  }
                },
                child: Text(
                  'Select',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
