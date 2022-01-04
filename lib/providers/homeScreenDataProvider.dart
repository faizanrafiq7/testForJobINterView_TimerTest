import 'package:flutter/material.dart';

class HomeDataProvider extends ChangeNotifier {
  String noTrainingInterviews;
  Duration timerTrainingInterview;
  Duration timerInterval;

  noTrainingInterviewsChange(var val) {
    noTrainingInterviews = val;
    notifyListeners();
  }

  timerTrainingInterviewChange(var val) {
    timerTrainingInterview = val;
    notifyListeners();
  }

  timerIntervalChange(var val) {
    timerInterval = val;
    notifyListeners();
  }
}
