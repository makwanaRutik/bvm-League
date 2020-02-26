import 'package:flutter/material.dart';
import 'package:bvm_primium_league/screens/singlePlayerCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bvm_primium_league/screens/playerInfo.dart';
import 'package:bvm_primium_league/screens/teamCard.dart';
import 'package:bvm_primium_league/StreamBuilderss.dart';

final _firestore = Firestore.instance;

class FlutterTabss extends StatefulWidget {
  static String id = 'flutterab id';
  @override
  _FlutterTabssState createState() => _FlutterTabssState();
}

class _FlutterTabssState extends State<FlutterTabss> {
  String name,
      DOB,
      team,
      playerType,
      totalRun,
      wicket,
      mobileNo,
      branch,
      teamNameTeam;


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
            title: Text('Information Page'),

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

              MessagesStream(),
            ],
          ),
        ),
      ),
    );
  }
}
