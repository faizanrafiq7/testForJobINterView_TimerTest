import 'package:chair_app/Services/Get_By_Album.dart';
import 'package:chair_app/Widgets/Error_Widget.dart';
import 'package:chair_app/Widgets/Tile_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'Album_Details_Screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

  List<Widget> tileList = [];
  _updateUI(var data) {
    List rawData = data['results']['albummatches']['album'];

    tileList = rawData
        .map((element) => GestureDetector(
              onTap: () {
                navigatePush(context, AlbumDetails(data: element));
              },
              child: UnexpandedWidget(
                name: '${element['name']}',
                image: '${element['image'][1]['#text']}',
                artist: '${element['artist']}',
                url: '${element['url']}',
              ),
            ))
        .toList();

    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    deviceHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom;

    deviceWidth = mediaQuery.size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.02),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: deviceHeight * 0.1,
                  child: Center(
                    child: CupertinoTextField(
                      controller: searchController,
                      onSubmitted: (val) {
                        _searchData();
                      },
                      cursorColor: Colors.black54,
                      placeholder: 'Search',
                      prefix: Icon(
                        Icons.search,
                        color: Colors.transparent,
                      ),
                      suffix: Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: Icon(
                          Icons.search,
                          color: Colors.black54,
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 217, 217, 217),
                          borderRadius: BorderRadius.circular(9)),
                    ),
                  ),
                ),
                Container(
                  height: deviceHeight * 0.1,
                  child: Center(
                    child: FlatButton(
                      color: Colors.teal,
                      child: Text(
                        'Search Album',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _searchData();
                      },
                    ),
                  ),
                ),
                Container(
                  height: deviceHeight * 0.77,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: tileList,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _searchData() async {
    if (searchController.text.isEmpty) {
      return;
    }
    try {
      var data = await Album().getByAlbum(searchController.text);
      _updateUI(data);
    } catch (e) {
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            return CustomErrorWidget('$e');
          });
    }
    FocusScope.of(context).unfocus();
  }
}
