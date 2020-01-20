import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  String _selectedLocation; // O
  static var _priorities = ['Public', 'Anonymous'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    String dropdownValue = 'Public';
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[

            // First element
            ListTile(
              title: DropdownButton(
                value: _selectedLocation,
                hint: Text("Please Choose local category                 "),
                  onChanged: (newValue)
                {
                  setState(() {
                    _selectedLocation=newValue;
                  });
                },
                  items: _locations.map((location) {
                    return DropdownMenuItem(
                      child: new Text(location),
                      value: location,
                    );
                  }).toList(),


              ),
            ),

            // Second Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('Something changed in Title Text Field');
                },
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),

            // Third Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),

              child: TextField(
                maxLines: 8,
                controller: descriptionController,

                style: textStyle,
                onChanged: (value) {
                  debugPrint('Something changed in Description Text Field');
                },
                decoration: InputDecoration(
                  hintText: 'Description',
//                  contentPadding: const EdgeInsets.symmetric(vertical: 40),
//                    labelText: 'Description',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),


            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 20,top: 15),
                  child: Text("Do you Want to go Anonymous?",style: TextStyle(color: Colors.blueAccent,fontSize: 15),),
                ),
                Expanded(
                  flex: 5,
                  child: Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {

                        isSwitched = value;
                        print(value);
                        return Alert(
                            context: context,
                            type: AlertType.warning,
                            title: "Warning",
                            desc: "Are You Sure To go Publish Your Profile",
                            buttons: [
                              DialogButton(
                                child: Text("Yes"),
                                onPressed: ()
                                {
                                  Navigator.pop(context);
                                },
                              ),
                              DialogButton(
                                child: Text("No"),
                                onPressed: ()
                                {
                                  isSwitched=true;
                                  Navigator.pop(context);
                                },
                              ),

                            ]
                        );
                      });
                    },
                    activeTrackColor: Colors.blueAccent,
                    activeColor: Colors.blue,
                  ),
                )

              ],
            ),
            SizedBox(height: 5,)
            , // Fourth Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'POST',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          debugPrint("Save button clicked");
                          if(isSwitched == false)
                            {
                          return  Alert(
                            context: context,
                            type: AlertType.error,
                            title: "Warning",
                            desc: "Are You Sure You Want to Show Your Profile",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Ok",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => Navigator.pop(context),
                                width: 120,
                              ),
                              DialogButton(
                                child: Text(
                                  "Nope",
                                  style: TextStyle(color: Colors.white, fontSize: 20),

                                ),

                                onPressed: () => Navigator.pop(context),
                                width: 120,
                              )
                            ],
                          ).show();}
                          else{
                            return  Alert(
                              context: context,
                              type: AlertType.error,
                              title: "Secret",
                              desc: "Anonymous Posted",
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "Ok",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  width: 120,
                                ),

                              ],
                            ).show();

                          }
                        });



                      },
                    ),
                  ),

                  Container(width: 5.0,),



                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
