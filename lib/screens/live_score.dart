import 'package:firebase_auth/firebase_auth.dart';
import 'package:bvm_primium_league/constants.dart';
import 'package:flutter/material.dart';

class LiveScore extends StatefulWidget {
  static String id = 'live_score';
  @override
  _LiveScoreState createState() => _LiveScoreState();
}

class _LiveScoreState extends State<LiveScore> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Live Score'),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 2, 0),
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 6,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 15, 0),
                    child: Text(
                      'IND vs PAK',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Text(
                  'IND: 173/9 in 19.4',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 25, right: 5),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage('images/player.png'),
                      ),
                    ),
                    Container(
                      child: Text(
                        'V Kohli',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      '48(34)',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 25, right: 5),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage('images/player.png'),
                      ),
                    ),
                    Container(
                      child: Text(
                        'MS Dhoni',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      '34(23)',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: 25),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Over:24.4',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(left: 25),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 15,
                      child: Text(
                        '6',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 15,
                      child: Text(
                        '1wd',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 5,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 15,
                      child: Text(
                        'w',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 15,
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 15,
                      child: Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 15,
                      child: Text(
                        '4',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(left: 25, right: 5),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Formate: 5/0 in 0.1.5',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Text(
                  'Four!!! from Dhoni',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
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
                            padding: EdgeInsets.fromLTRB(10,20,0,0),
                            width: double.infinity,
                            height: 60,
                            color: Colors.grey.shade300,
                            child: Text(

                              'Match',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10,20,0,0),
                            width: double.infinity,
                            height: 60,
                            color: Colors.grey.shade300,
                            child: Text(
                              'Date',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10,20,0,0),
                            width: double.infinity,
                            height: 60,
                            color: Colors.grey.shade300,
                            child: Text(
                              'venue',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10,20,0,0),
                            width: double.infinity,
                            height: 60,
                            //padding: EdgeInsets.only(top: 5,bottom: 5),
                            color: Colors.grey.shade300,
                            child: Text(
                              'Toss',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10,20,0,0),
                            width: double.infinity,
                            height: 60,
                            //padding: EdgeInsets.only(top: 5,bottom: 5),
                            color: Colors.grey.shade300,
                            child: Text(
                              'Series',
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
                            padding: EdgeInsets.fromLTRB(10,20,0,0),
                            width: double.infinity,
                            //width: 150,
                            height: 60,
                            color: Colors.white,
                            child: Text(
                              'IND VS PAK',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10,20,0,0),
                            width: double.infinity,
                            height: 60,
                            color: Colors.white,
                            child: Text(
                              '22 july 2018 10:00AM',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10,20,0,0),
                            height: 60,
                            width: double.infinity,
                            color: Colors.white,
                            child: Text(
                              'Sastri Medan',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10,20,0,0),
                            height: 60,
                            width: double.infinity,
                            //padding: EdgeInsets.only(top: 5,bottom: 5),
                            color: Colors.white,
                            child: Text(
                              'IND won the toss!!!',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10,20,0,0),
                            height: 60,
                            width: double.infinity,
                            //padding: EdgeInsets.only(top: 5,bottom: 5),
                            color: Colors.white,
                            child: Text(
                              '2020',
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
    );
  }
}
//Container(
//child: Row(
//mainAxisAlignment: MainAxisAlignment.center,
////crossAxisAlignment: CrossAxisAlignment.stretch,
//
//children: <Widget>[
//Column(
//
//children: <Widget>[
//Expanded(
//
//child: Container(
//
//padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
//color: Colors.grey,
//child: Text('thunder',
//),
//),
//),
//Expanded(
//child: Container(
//padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//color: Colors.grey,
//child: Text('thunder'),
//),
//),
//Expanded(
//child: Container(
//padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//color: Colors.grey,
//child: Text('thunder'),
//),
//),
//Expanded(
//child: Container(
//padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//color: Colors.grey,
//child: Text('thunder'),
//),
//),
//Expanded(
//child: Container(
//padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//color: Colors.grey,
//child: Text('thunder'),
//),
//),
//Expanded(
//child: Container(
//padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//color: Colors.grey,
//child: Text('thunder'),
//),
//),
//],
//),
//Column(
//children: <Widget>[
//Expanded(
//child: Container(
//padding: EdgeInsets.fromLTRB(100, 10, 10, 10),
//color: Colors.grey,
//child: Text('thunder'),
//),
//),
//Expanded(
//child: Container(
//color: Colors.grey,
//child: Text('thunder'),
//),
//),
//Expanded(
//child: Container(
//color: Colors.grey,
//child: Text('thunder'),
//),
//),
//Expanded(
//child: Container(
//color: Colors.grey,
//child: Text('thunder'),
//),
//),
//Expanded(
//child: Container(
//color: Colors.grey,
//child: Text('thunder'),
//),
//),
//Expanded(
//child: Container(
//color: Colors.grey,
//child: Text('thunder'),
//),
//),
//],
//),
//],
//),
//),
