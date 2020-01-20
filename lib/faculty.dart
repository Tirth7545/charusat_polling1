import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Faculty extends StatefulWidget {
  @override
  _FacultyState createState() => _FacultyState();
}

class _FacultyState extends State<Faculty> {
  PageController _pageController;
  int _Page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  List<Color> ll = [
    Colors.yellow[50],
    Colors.red[50],
    Colors.cyan[50],
  ];
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: Colors.transparent,
        activeIconColor: Colors.pinkAccent,
//          index: 0,
//          backgroundColor: ll[_page],
        key: _bottomNavigationKey,
        tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.add, title: "Add"),
          TabData(iconData: Icons.bookmark, title: "Bookmark")
        ],
        onTabChangedListener: (index) {
          setState(() {
//              print(_bottomNavigationKey);
            _page = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
      body: PageView(
          physics: new NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: <Widget>[
            Container(
              color: Colors.yellow,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.cyan,
            ),
          ],
          onPageChanged: (int index) {
            setState(() {});
          }),
    );
  }
}
