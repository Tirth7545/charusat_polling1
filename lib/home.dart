import 'package:flutter/material.dart';

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
      title: Text(
        "Speak Up",
        style: TextStyle(color: Colors.black),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list,color: Colors.black),
          onPressed: () {},
        )
      ],
    );
    final makeListTile = ListTile(
      title: Text('Three-line ListTile'),
      subtitle: Text(
          'A sufficiently long subtitle warrants three lines.sfasjfdklajsdfjlsajflasjfdlajsldflasjdflkjaskdfjlasjdfljasldjflajsdlfkjalsdjflasjlfkasldfjlsajk'),
      trailing: Icon(Icons.more_vert),
    );

    final makeCard = Card(

      elevation: 8.0,

      margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container
        (


        decoration: BoxDecoration(color: Colors.white,
          shape: BoxShape.circle,

        ),
        child: makeListTile,
      ),
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
