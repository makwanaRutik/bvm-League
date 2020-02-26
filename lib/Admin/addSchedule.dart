import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _formKeyPlayer1 = GlobalKey<FormState>();
var controllerTeam1 = TextEditingController();
var controllerTeam2 = TextEditingController();
var controllerTime = TextEditingController();
var controllerDate = TextEditingController();
final _firestore = Firestore.instance;

class AddSchedule extends StatefulWidget {
  static String id = 'AddScheduleid';
  @override
  _AddScheduleState createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  String team1, team2, date, time;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Schedule'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKeyPlayer1,
            child: Column(
              children: <Widget>[
                Text('Team 1 name'),
                TextFormField(
                    controller: controllerTeam1,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Team 1 Name',
                    ),
                    onChanged: (value) {
                      team1 = value;
                    }),
                Text('Team 2 name'),
                TextFormField(
                    controller: controllerTeam2,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Team 2 Name',
                    ),
                    onChanged: (value) {
                      team2 = value;
                    }),
                Text('TIme'),
                TextFormField(
                    controller: controllerTime,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Starting time of the Match',
                    ),
                    onChanged: (value) {
                      time = value;
                    }),
                Text('Date'),
                TextFormField(
                    controller: controllerDate,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Date of the match',
                    ),
                    onChanged: (value) {
                      date = value;
                    }),
                FlatButton(
                    color: Colors.lightBlueAccent,
                    onPressed: () async {
                      if (_formKeyPlayer1.currentState.validate()) {
                        await _firestore.collection('schedule').add({
                          'team1': team1,
                          'team2': team2,
                          'time': time,
                          'date': date,
                        });
                        controllerDate.clear();
                        controllerTeam1.clear();
                        controllerTeam2.clear();
                        controllerTime.clear();
                      }
                    },
                    child: Text('Submit'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
