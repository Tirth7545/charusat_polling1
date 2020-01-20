import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'home.dart';
import 'add.dart';

class Student extends StatefulWidget {
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  PageController _pageController;
  int _Page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  List<Color> ll = [
    Colors.purpleAccent,
    Colors.white,
    Colors.cyan,
  ];

  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
//        circleColor: Colors.transparent,
//        activeIconColor: Colors.pinkAccent,
//          index: 0,
          backgroundColor: ll[_page],
        key: _bottomNavigationKey,
//        tabs: [
//          TabData(iconData: Icons.home, title: "Home"),
//          TabData(iconData: Icons.add, title: "Add"),
//          TabData(iconData: Icons.bookmark, title: "Bookmark")
//        ],
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.bookmark , size: 30),
        ],
//        onTabChangedListener: (index) {
//          setState(() {
////              print(_bottomNavigationKey);
//            _page = index;
//            _pageController.jumpToPage(index);
//          });
//        },
        onTap: (index) {
          setState(() {
            _page = index;
            _pageController.jumpToPage(index);
          });
        },
      ),

//      appBar: AppBar(
//        title: Text("Charusast Polling",),
////        backgroundColor: Color(0xfff8faf8),
//          backgroundColor: Colors.blueAccent,
//      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text("Tirthrajsinh Zala"),
              accountEmail: Text("17dce070@charusat.edu.in"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.green,
                child: new Text(
                  "T",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            ListTile(
              title: new Text("Page one "),
              trailing: Icon(Icons.arrow_upward),
            ),
            ListTile(
              title: new Text("Page two "),
              trailing: Icon(Icons.arrow_downward),
            ),
            Divider(),
            ListTile(
              title: new Text("Close"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: PageView(
          physics: new NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: <Widget>[
            Home(),
            Add(),
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
