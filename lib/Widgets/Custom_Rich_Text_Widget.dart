import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String first;
  final String second;
  const CustomRichText({@required this.first, @required this.second});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: '$first: ',
          style: TextStyle(
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(
              text: ' $second',
              style: TextStyle(
                color: Colors.blueAccent,
              ),
            )
          ]),
    );
  }
}
