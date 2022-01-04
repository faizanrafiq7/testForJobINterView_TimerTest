import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

errorWid(var context, String err) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => Theme(
      data: ThemeData.dark(),
      child: CupertinoAlertDialog(
        title: Text("Alert\n"),
        content: Text("$err"),
        actions: [
          CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              isDefaultAction: true,
              child: Text(
                "OK",
                style: TextStyle(color: Colors.black),
              )),
        ],
      ),
    ),
  );
}
