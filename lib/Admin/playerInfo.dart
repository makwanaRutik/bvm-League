import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class playerInfoAdmin extends StatefulWidget {
  static String id = 'playerr infiAdmin';
  @override
  _playerInfoAdminState createState() => _playerInfoAdminState();
}

class _playerInfoAdminState extends State<playerInfoAdmin> {
  String name, DOB, team, playerType, totalRun, wicket, mobileNo, branch;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataOfPlayerInfo();
  }

  void getDataOfPlayerInfo() async {
    final playerInfodata =
        await _firestore.collection('playerInfo').getDocuments();
    for (var dataOfPlayer in playerInfodata.documents) {
      name = dataOfPlayer.data['name'];
      DOB = dataOfPlayer.data['DOB'];
      mobileNo = dataOfPlayer.data['mobile no'];
      print(mobileNo);
      branch = dataOfPlayer.data['branch'];
     // print('branch$branch');
      playerType = dataOfPlayer.data['player type'];
      team = dataOfPlayer.data['team'];
      totalRun = dataOfPlayer.data['total run'];
      wicket = dataOfPlayer.data['wicket'];
      //print(wicket);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Player Info'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 100,
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
                                'DOB',
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
                                '$name',
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
                                '$DOB',
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
                                '$team',
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
                                '$playerType',
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
                                '$totalRun',
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
                                '$wicket',
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
                                '$mobileNo',
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
                                '$branch',
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
      ),
    );
  }
}
