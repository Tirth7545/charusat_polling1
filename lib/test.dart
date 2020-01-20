import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class Faculty extends StatefulWidget {
  @override
  _FacultyState createState() => _FacultyState();
}

class _FacultyState extends State<Faculty> {
  PageController _pageController;

  int _Page=0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
      return Scaffold(

        body: PageView(

            controller: _pageController,
            children: <Widget>[

              Container(color: Colors.yellow,),
              Container(color: Colors.red,),
              Container(),
              Container()

            ],
            onPageChanged: (int index) {
              setState(() {

                _pageController.jumpToPage(index);
              });
            }
        ),


        bottomNavigationBar: CurvedNavigationBar(
          animationCurve: Curves.easeInOutBack,

          index:3,

          items: <Widget>[
            Icon(Icons.search, size: 30, color: Colors.white, ),
            Icon(Icons.trending_up, size: 30, color: Colors.white),
            Icon(Icons.group, size: 30, color: Colors.white),
            Icon(Icons.person, size: 30, color: Colors.white)
          ],
          color: Colors.blueAccent,
          backgroundColor: Colors.white,
          height: 60.0,
          onTap: (int index) {
            setState(() {
              _pageController.jumpToPage(index);
            });
          },

        ),
      );
  }
}
