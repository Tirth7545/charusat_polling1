import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'lesson.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;
  final List<String> Catg = [
    "First", "Second", "3", "4", "5", "6", "7", "8", "9", "10"];

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List lessons;
  @override
  void initState() {
    lessons = getLessons();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Text(
        "Speak Up",
        style: TextStyle(color: Colors.black),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list, color: Colors.black),
          onPressed: () {},
        )
      ],
    );
    ListTile makeListTile(Lesson lesson) => ListTile(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(lesson.title),
      ),
      trailing: Icon(Icons.more_vert),
      subtitle: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                lesson.desc),
            SizedBox(
              height: 12,
            ),
            Row(
              children: <Widget>[
                Container(
                  child: LikeButton(
                    circleColor: CircleColor(
                        start: Color(0xff00ddff), end: Color(0xff0099cc)),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Color(0xff33b5e5),
                      dotSecondaryColor: Color(0xff0099cc),
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.arrow_upward,
                        color: isLiked ? Colors.green : Colors.grey,
                      );
                    },
                    likeCount: 121,
                    countBuilder: (int count, bool isLiked, String text) {
                      var color = isLiked ? Colors.green : Colors.grey;
                      Widget result;
                      if (count == 0) {
                        result = Text(
                          "love",
                          style: TextStyle(color: color),
                        );
                      } else
                        result = Text(
                          text,
                          style: TextStyle(color: color),
                        );
                      return result;
                    },
                  ),
                ),
                SizedBox(
                  width: 45,
                ),
                Container(
                  child: LikeButton(
                    circleColor: CircleColor(
                        start: Color(0xff00ddff), end: Color(0xff0099cc)),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Color(0xff33b5e5),
                      dotSecondaryColor: Color(0xff0099cc),
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.arrow_downward,
                        color: isLiked ? Colors.red : Colors.grey,
                      );
                    },
                    likeCount: 5,
                    countBuilder: (int count, bool isLiked, String text) {
                      var color = isLiked ? Colors.red : Colors.grey;
                      Widget result;
                      if (count == 0) {
                        result = Text(
                          "love",
                          style: TextStyle(color: color),
                        );
                      } else
                        result = Text(
                          text,
                          style: TextStyle(color: color),
                        );
                      return result;
                    },
                  ),
                )
              ],
            ),
            Divider(
              color: Colors.purpleAccent,
            ),
            Row(
              children: <Widget>[
                Container(
                  child: Text(lesson.time),
                ),
                SizedBox(
                  width: 70,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(
                      lesson.user,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );

    Card makeCard(Lesson lesson) => Card(
              elevation: 8.0,
              margin: new EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: makeListTile(lesson),
              ),
            );



    final makeBody = Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(1.7, 0.0),
              tileMode: TileMode.repeated,
              colors: [
                Colors.purple[400],
                Colors.purple[300],
              ])),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index]);
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: topAppBar,
      body: makeBody,
    );
  }
}

List getLessons() {
  return [

  Lesson(
  title: "Library Issue",
  desc: "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
  time: "5 Second ago",
  user: "~SpJhala"),
  Lesson(
  title: "Attendance",
  desc: "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
  time: "1 hour ago",
  user: "~Anonymous"),
  Lesson(
      title: "Hostel",
      desc: "In our hostel food and hygiene in not up to thw mark and management is also not supportive",
      time: "1 hour ago",
      user: "~Ashay"),
  Lesson(
      title: "Curriculum",
      desc: "Python subject should be introduced as early as possible in btech.",
      time: "1 hour ago",
      user: "~Rahul")

  ];
}