import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Custom_Rich_Text_Widget.dart';

class UnexpandedWidget extends StatelessWidget {
  final String name;
  final String artist;
  final String url;
  final String image;

  const UnexpandedWidget(
      {@required this.name,
      @required this.url,
      @required this.image,
      @required this.artist});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 300,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 15, top: 30),
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(20))),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRichText(
                  first: 'Album',
                  second: '$name',
                ),
                CustomRichText(
                  first: 'Artist',
                  second: '$artist',
                ),
                CustomRichText(
                  first: 'Url',
                  second: '$url',
                ),
              ],
            ),
            Positioned(
              right: -67,
              top: -40,
              child: ClipOval(
                child: Container(
                  height: 50,
                  // child: Image.asset('assets/images/placeHolder.png'),
                  // child: Image.network(image),
                  child: FadeInImage.assetNetwork(
                      fadeInDuration: const Duration(seconds: 10),
                      placeholder: 'assets/images/placeHolder.png',
                      image: image),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
