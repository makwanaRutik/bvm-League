import 'package:flutter/material.dart';

class PlayerQueryInfoPage extends StatelessWidget {
  PlayerQueryInfoPage(
      {@required this.name,
      @required this.branch,
      @required this.team,
      @required this.mobileNo,
      @required this.wicket,
      @required this.totalRun,
      @required this.playerType,
      @required this.DOB});
  final String name, DOB, team, playerType, totalRun, wicket, mobileNo, branch;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Player Info'),
          centerTitle: true,
          actions: <Widget>[
            FlatButton(
              child: Text('Back',style: TextStyle(fontSize: 20,color: Colors.white),),
              onPressed: (){
              Navigator.pop(context);
              },
            ),
          ],
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
//DOB = (info.data['DOB']);
//playerType = (info.data['player type']);
//totalRun = (info.data['total run']);
//wicket = (info.data['wicket']);
//mobileNo = (info.data['mobile no.']);