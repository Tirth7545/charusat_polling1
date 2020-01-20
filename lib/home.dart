import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    final makeListTile = ListTile(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Category'),
      ),
      trailing: Icon(Icons.more_vert),
      subtitle: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                'A sufficiently long subtitle warrants three lines.sfasjfdklajsdfjlsajflasjfdlajsldflasjdflkjaskdfjlasjdfljasldjflajsdlfkjalsdjflasjlfkasldfjlsajk'),
            SizedBox(
              height: 12,
            ),
            Row(
              children: <Widget>[
                Container(
                  child: LikeButton(

                    circleColor:
                    CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Color(0xff33b5e5),
                      dotSecondaryColor: Color(0xff0099cc),
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.arrow_upward,
                        color: isLiked ? Colors.deepPurpleAccent : Colors.grey,

                      );
                    },
                    likeCount: 121,
                    countBuilder: (int count, bool isLiked, String text) {
                      var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
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
                SizedBox(width: 45,),
                Container(
                  child: LikeButton(

                    circleColor:
                    CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
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
                  child: Text("2 hours ago"),
                ),
                SizedBox(
                  width: 70,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(
                      "~Anonymous",
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

    final makeCard = Stack(
      children: <Widget>[
        Positioned(
            child: Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: makeListTile,
          ),
        )),

        

      ],
    );

    final makeBody = Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(1.7, 0.0),
              tileMode: TileMode.repeated,
              colors: [
//                const Color(0xFFFFFFEE), const Color(0xFF999999)
            Colors.purple[400],
//        Colors.purple[400],
            Colors.purple[300],
//        Colors.purple[300],
//        Colors.purple[300],
//        Colors.purple[200]
//            Colors.blue[700],
//            Colors.blue[400],
//            Colors.blue[300]
          ])),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return makeCard;
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
