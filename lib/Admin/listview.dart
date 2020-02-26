import 'package:flutter/material.dart';
import 'package:bvm_primium_league/Admin/singlePlayerCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bvm_primium_league/Admin/playerInfo.dart';
import 'package:bvm_primium_league/Admin/teamCard.dart';
import 'package:bvm_primium_league/StreamBuilderss.dart';

final _formKey = GlobalKey<FormState>();
final _firestore = Firestore.instance;

class FlutterTabssAdmin extends StatefulWidget {
  static String id = 'flutterab id Admin';
  @override
  _FlutterTabssAdminState createState() => _FlutterTabssAdminState();
}

class _FlutterTabssAdminState extends State<FlutterTabssAdmin> {
  String name,
      DOB,
      team,
      playerType,
      totalRun,
      wicket,
      mobileNo,
      branch,
      teamNameTeam;
  Future<String> _asyncInputDialog(BuildContext context) async {
    String teamName = '';
    return showDialog<String>(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter players data'),
          content: Form(
            key: _formKey,
            child: Container(
              height: 300.0,
              width: 150.0,
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  TextFormField(

                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration:
                        InputDecoration(hintText: 'Enter player Date of Birth'),
                    onChanged: (value) {
                      this.DOB = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: 'Enter player Name'),
                    onChanged: (value) {
                      this.name = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: 'Enter players team'),
                    onChanged: (value) {
                      this.team = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: 'Enter player type'),
                    onChanged: (value) {
                      this.playerType = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: 'Enter player run'),
                    onChanged: (value) {
                      this.totalRun = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration:
                        InputDecoration(hintText: 'Enter player Wicket'),
                    onChanged: (value) {
                      this.wicket = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration:
                        InputDecoration(hintText: 'Enter player Mobile No.'),
                    onChanged: (value) {
                      this.mobileNo = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration:
                        InputDecoration(hintText: 'Enter player branch'),
                    onChanged: (value) {
                      this.branch = value;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Submit'),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  await _firestore.collection('playerInfo').add({
                    'name': name,
                    'DOB': DOB,
                    'team': team,
                    'player type': playerType,
                    'total run': totalRun,
                    'wicket': wicket,
                    'mobile no': mobileNo,
                    'branch': branch,
                    'liverun':'0',
                    'liveball':0,
                  });

                  Navigator.pop(context);
                }
                //Navigator.pushNamed(context, playerInfo.id);
              },
            ),
          ],
        );
      },
    );
  }

  Future<String> _asyncTeamInputDialog(BuildContext context) async {
    String teamName = '';
    return showDialog<String>(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter players data'),
          content: Container(
            height: 100.0,
            width: 150.0,
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Team Name',
                  ),
                  onChanged: (value) {
                    teamNameTeam = value;
                  },
                ),
                SizedBox(height: 5.0),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Submit'),
              onPressed: () async {
                await _firestore.collection('Teams').add({
                  'teamname': teamNameTeam,
                });

                Navigator.pop(context);
                //Navigator.pushNamed(context, playerInfo.id);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Text(
                  'Groups',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Teams',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Players',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            title: Text(
              'Information Page',
              style: TextStyle(fontSize: 25),
            ),
            actions: <Widget>[
//
              FlatButton(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Add',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Text(
                      'Player',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
                onPressed: () {
                  _asyncInputDialog(context);
                },
              ),
              FlatButton(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Add',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Text(
                      'Team',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
                onPressed: () {
                  _asyncTeamInputDialog(context);
                },
              )
            ],
          ),
          body: TabBarView(
            children: [
              //Icon(Icons.chat_bubble_outline),
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('images/rutik.jpg'),
                    ),
                    Expanded(
                      flex: 14,
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                    width: double.infinity,
                                    height: 60,
                                    color: Colors.grey.shade300,
                                    child: Text(
                                      'Name',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                    width: double.infinity,
                                    height: 60,
                                    color: Colors.grey.shade300,
                                    child: Text(
                                      'Date of Birth',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                    width: double.infinity,
                                    height: 60,
                                    //padding: EdgeInsets.only(top: 5,bottom: 5),
                                    color: Colors.grey.shade300,
                                    child: Text(
                                      'Team',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                    width: double.infinity,
                                    height: 60,
                                    //padding: EdgeInsets.only(top: 5,bottom: 5),
                                    color: Colors.grey.shade300,
                                    child: Text(
                                      'Player Type',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                    width: double.infinity,
                                    height: 60,
                                    //padding: EdgeInsets.only(top: 5,bottom: 5),
                                    color: Colors.grey.shade300,
                                    child: Text(
                                      'Total Run',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                    width: double.infinity,
                                    height: 60,
                                    //padding: EdgeInsets.only(top: 5,bottom: 5),
                                    color: Colors.grey.shade300,
                                    child: Text(
                                      'Wicket',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                    width: double.infinity,
                                    height: 60,
                                    //padding: EdgeInsets.only(top: 5,bottom: 5),
                                    color: Colors.grey.shade300,
                                    child: Text(
                                      'Mobile No.',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                    width: double.infinity,
                                    height: 60,
                                    //padding: EdgeInsets.only(top: 5,bottom: 5),
                                    color: Colors.grey.shade300,
                                    child: Text(
                                      'Branch',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                    width: double.infinity,
                                    //width: 150,
                                    height: 60,
                                    color: Colors.white,
                                    child: Text(
                                      'Makwana Rutvik M.',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                    width: double.infinity,
                                    //width: 150,
                                    height: 60,
                                    color: Colors.white,
                                    child: Text(
                                      '10 July 1999',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                    width: double.infinity,
                                    //width: 150,
                                    height: 60,
                                    color: Colors.white,
                                    child: Text(
                                      'God of Thunder',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                    width: double.infinity,
                                    //width: 150,
                                    height: 60,
                                    color: Colors.white,
                                    child: Text(
                                      'All Rounder',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                    width: double.infinity,
                                    //width: 150,
                                    height: 60,
                                    color: Colors.white,
                                    child: Text(
                                      '456',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                    height: 60,
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: Text(
                                      '23',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                    height: 60,
                                    width: double.infinity,
                                    //padding: EdgeInsets.only(top: 5,bottom: 5),
                                    color: Colors.white,
                                    child: Text(
                                      '9675747832',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                    height: 60,
                                    width: double.infinity,
                                    //padding: EdgeInsets.only(top: 5,bottom: 5),
                                    color: Colors.white,
                                    child: Text(
                                      'Information Technology',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              StreamTeams(),

              MessagesStreamAdmin(),
            ],
          ),
        ),
      ),
    );
  }
}
