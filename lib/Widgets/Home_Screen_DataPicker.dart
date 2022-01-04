import 'package:chair_app/providers/homeScreenDataProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'Timer_Picker.dart';

class HomeScreenDataPicker extends StatefulWidget {
  final String whichNo;
  final FocusNode focusNode;

  const HomeScreenDataPicker({@required this.whichNo, this.focusNode, Key key})
      : super(key: key);

  @override
  _HomeScreenDataPickerState createState() => _HomeScreenDataPickerState();
}

class _HomeScreenDataPickerState extends State<HomeScreenDataPicker> {
  bottomSheet(var context, String whichNo) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (context) => TimerPicker(
              widgetNo: whichNo,
            ));
  }

  textWidget() {
    return Text(
      widget.whichNo == '1'
          ? 'Total Training Interviews'
          : widget.whichNo == '2'
              ? 'Total Training Interviews'
              : 'Break Interval Timer',
      style: TextStyle(
        fontSize: 15,
        color: Colors.black54,
      ),
    );
  }

  textFieldWidget() {
    var provider = Provider.of<HomeDataProvider>(context, listen: true);
    return TextField(
      enabled: widget.whichNo == '1' ? true : false,
      autofocus: widget.whichNo == '1' ? true : false,
      maxLength: 1,
      focusNode: widget.whichNo == '1' ? widget.focusNode : null,
      keyboardType: TextInputType.number,
      onChanged: (val) {
        context.read<HomeDataProvider>().noTrainingInterviewsChange(val);
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        counterText: "",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 1.0),
        ),
        labelText: widget.whichNo == '1'
            ? ''
            : widget.whichNo == '2'
                ? provider.timerTrainingInterview == null
                    ? ''
                    : provider.timerTrainingInterview.toString().substring(2, 7)
                : provider.timerInterval == null
                    ? ''
                    : provider.timerInterval.toString().substring(2, 7),
      ),
      style: TextStyle(fontSize: 18, color: Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.whichNo == '1') {
          widget.focusNode.nextFocus();
        } else if (widget.whichNo == '2') {
          bottomSheet(context, '2');
        } else {
          bottomSheet(context, '3');
        }
      },
      child: Container(
        padding: EdgeInsets.only(
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            top: screenHeight * 0.01,
            bottom: 0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(),
            textFieldWidget(),
          ],
        ),
      ),
    );
  }
}
