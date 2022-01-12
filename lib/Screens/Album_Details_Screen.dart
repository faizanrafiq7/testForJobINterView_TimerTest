import 'package:flutter/material.dart';

class AlbumDetails extends StatelessWidget {
  final dynamic data;

  const AlbumDetails({@required this.data});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.black,
            child: Text(
              '$data',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
