import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _formKeyPlayer1 = GlobalKey<FormState>();
final _formKeyPlayer2 = GlobalKey<FormState>();
final _formKeynewPlayer2 = GlobalKey<FormState>();
final _formKeynewPlayer1 = GlobalKey<FormState>();
final _formKeyballer = GlobalKey<FormState>();

TextEditingController controllerName = TextEditingController();
TextEditingController controllerRun = TextEditingController();
//TextEditingController controllerWicket = TextEditingController();
TextEditingController controllerName1 = TextEditingController();
TextEditingController controllerRun1 = TextEditingController();
//TextEditingController controllerWicket1 = TextEditingController();
final _firestore = Firestore.instance;

class EditRunOfThePlayer extends StatefulWidget {
  static String id = 'EditRunOfThePlayerid';
  @override
  _EditRunOfThePlayerState createState() => _EditRunOfThePlayerState();
}

class _EditRunOfThePlayerState extends State<EditRunOfThePlayer> {
  String playername1,
      run1,
      wicket1,
      playername2,
      run2,
      wicket2,
      newplayer1,
      newplayer2;
  int balls;
  bool validateplayer1 = false;
  bool validateplayer2 = false;
  bool validaterun1 = false;
  bool validaterun2 = false;
  bool validatenewplayer1 = false;
  bool validatenewplayer2 = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Live Player Data'),
            centerTitle: true,
          ),
          body: ListView(
            children: <Widget>[
              Form(
                key: _formKeyPlayer1,
                child: Column(
                  children: <Widget>[
                    // Text('Player name'),
                    TextFormField(
                      controller: controllerName,
                      autovalidate: validateplayer1,
                      validator: validateName,
                      decoration: InputDecoration(
                        labelText: 'Player 1 name',
                        hintText: 'Enter Player 1 Name',
                      ),
                      onChanged: (value) {
                        playername1 = value;
                      },
                    ),
                    //Text(' Run'),
                    TextFormField(
                      autovalidate: validaterun1,
                      controller: controllerRun,
                      validator: (value) {
                        RegExp regex = RegExp('[0-6]{1}');
                        RegExp regexw = RegExp('[wW]{1}');
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        } else if (!(value.length == 1) ||
                            !((regex.hasMatch(value) ||
                                (regexw.hasMatch(value))))) {
                          return 'enter only 1 digit and only w character';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Player 1 Run',
                        hintText: 'Enter player 1 run',
                      ),
                      onChanged: (value) {
                        run1 = value;
                      },
                    ),
//                    Text('wicket'),
//                    TextFormField(
//                      controller: controllerWicket,
//                      validator: (value) {
//                        if (value.isEmpty) {
//                          return 'Please enter some text';
//                        }
//                        return null;
//                      },
//                      decoration: InputDecoration(
//                        hintText: 'Enter wicket',
//                      ),
//                      onChanged: (value) {
//                        wicket1 = value;
//                      },
//                    ),
                    FlatButton(
                      color: Colors.lightBlueAccent,
                      child: Text('Submit'),
                      onPressed: () async {
                        if (!_formKeyPlayer1.currentState.validate()) {
                          validateplayer1 = true;
                          validaterun1 = true;
                        } else if (_formKeyPlayer1.currentState.validate() &&
                            run1 == 'w') {
                          controllerRun1.clear();
                          controllerName1.clear();
                          final livescoreID = await _firestore
                              .collection('livescore') /**/
                              .where('player1', isEqualTo: playername2)
                              .getDocuments();
                          String idCollection;
                          int totalrunLivescore;
                          int liveballlivescore, playerrun2, ballplayer2;
                          for (var Oflivescore in livescoreID.documents) {
                            idCollection = Oflivescore.documentID;
                            //print(idCollection);
                            totalrunLivescore = Oflivescore['totalrun'];
                            print(totalrunLivescore);
                            liveballlivescore = Oflivescore['totalball'];
                            //print(liveballlivescore);
                            playerrun2 = Oflivescore['playerrun1'];
                            //print(playerrun2);
                            ballplayer2 = Oflivescore['playerball1'];
                            //print(ballplayer2);
                          }
                          int updaterun = 0;
                          int totalrunLive, playerrunupdate2;
                          playerrunupdate2 = playerrun2 + updaterun;
                          totalrunLive = totalrunLivescore + updaterun;
                          int overOflive =
                              ((liveballlivescore + 1) / 6).truncate();
                          await _firestore
                              .collection('livescore')
                              .document('livescoe')
                              .updateData({
                            'totalrun': totalrunLive,
                            'playerrun1': playerrunupdate2,
                            'totalball': liveballlivescore + 1,
                            'totalover': overOflive,
                            'totaloverdecimal': (liveballlivescore + 1) % 6,
                            'playerball1': (ballplayer2 + 1),
                            'singleRun': 10,
                          });
                        } else {
                          if (_formKeyPlayer1.currentState.validate()) {
                            print('in the gate');
                            //print(team1);
                            final fromPlayerInfo = await _firestore
                                .collection('playerInfo')
                                .where('name', isEqualTo: playername1)
                                .getDocuments();
                            String updaterunInplayerInfoID;
                            String previuosrun, totalPreviuosrun;
                            int previousball;
                            for (var forFromPlayerInfo
                                in fromPlayerInfo.documents) {
                              updaterunInplayerInfoID =
                                  forFromPlayerInfo.documentID;
                              previuosrun = forFromPlayerInfo['liverun'];
                              totalPreviuosrun = forFromPlayerInfo['total run'];
                              previousball = forFromPlayerInfo['liveball'];
                              print(previuosrun);
                            }
                            int prerun, updaterun, totalrun, fullrun;
                            prerun = int.parse(previuosrun);
                            updaterun = int.parse(run1);
                            totalrun = prerun + updaterun;
                            fullrun = int.parse(totalPreviuosrun) + updaterun;
                            previousball = previousball + 1;

                            await _firestore
                                .collection('playerInfo')
                                .document(updaterunInplayerInfoID)
                                .updateData({
                              'liverun': totalrun.toString(),
                              'total run': fullrun.toString(),
                              'liveball': previousball,
                            });

                            final livescoreID = await _firestore
                                .collection('livescore')
                                .where('player1', isEqualTo: playername1)
                                .getDocuments(); /**/
                            String idCollection;
                            int totalrunLivescore;
                            int liveballlivescore, playerrun1, ballplayer1;
                            for (var Oflivescore in livescoreID.documents) {
                              idCollection = Oflivescore.documentID;
                              totalrunLivescore = Oflivescore['totalrun'];
                              print(totalrunLivescore);
                              liveballlivescore = Oflivescore['totalball'];
                              playerrun1 = Oflivescore['playerrun1'];
                              ballplayer1 = Oflivescore['playerball1'];
                            }
                            int totalrunLive;
                            totalrunLive = totalrunLivescore + updaterun;
                            int playerrunUpadate1 = playerrun1 + updaterun;
                            int overOflive =
                                ((liveballlivescore + 1) / 6).truncate();
                            await _firestore
                                .collection('livescore')
                                .document('livescoe')
                                .updateData({
                              'totalrun': totalrunLive,
                              'playerrun1': playerrunUpadate1,
                              'totalball': liveballlivescore + 1,
                              'totalover': overOflive,
                              'totaloverdecimal': (liveballlivescore + 1) % 6,
                              'playerball1': (ballplayer1 + 1),
                              'singleRun': updaterun,
                              'selectPlayer': 1,
                            });
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKeyPlayer2,
                child: Column(
                  children: <Widget>[
                    //Text('Player name'),
                    TextFormField(
                      autovalidate: validatenewplayer2,
                      controller: controllerName1,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Player 2 Name',
                        hintText: 'Enter player 2 Name',
                      ),
                      onChanged: (value) {
                        playername2 = value;
                      },
                    ),
                    //Text(' Run'),
                    TextFormField(
                      autovalidate: validaterun2,
                      controller: controllerRun1,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Player 2 Run',
                        hintText: 'Enter player 2 run',
                      ),
                      onChanged: (value) {
                        run2 = value;
                      },
                    ),
//                    Text('wicket'),
//                    TextFormField(
//                      controller: controllerWicket1,
//                      validator: (value) {
//                        if (value.isEmpty) {
//                          return 'Please enter some text';
//                        }
//                        return null;
//                      },
//                      decoration: InputDecoration(
//                        hintText: 'Enter wicket',
//                      ),
//                      onChanged: (value) {
//                        wicket2 = value;
//                      },
//                    ),
                    FlatButton(
                      color: Colors.lightBlueAccent,
                      child: Text('Submit'),
                      onPressed: () async {
                        if (_formKeyPlayer2.currentState.validate() &&
                            run2 == 'w') {
                          controllerRun1.clear();
                          controllerName1.clear();
                          final livescoreID = await _firestore
                              .collection('livescore')
                              .where('player2', isEqualTo: playername2)
                              .getDocuments();
                          String idCollection;
                          int totalrunLivescore;
                          int liveballlivescore, playerrun2, ballplayer2;
                          for (var Oflivescore in livescoreID.documents) {
                            idCollection = Oflivescore.documentID;
                            //print(idCollection);
                            totalrunLivescore = Oflivescore['totalrun'];
                            print(totalrunLivescore);
                            liveballlivescore = Oflivescore['totalball'];
                            //print(liveballlivescore);
                            playerrun2 = Oflivescore['playerrun2'];
                            //print(playerrun2);
                            ballplayer2 = Oflivescore['playerball2'];
                            //print(ballplayer2);
                          }
                          int updaterun = 0;
                          int totalrunLive, playerrunupdate2;
                          playerrunupdate2 = playerrun2 + updaterun;
                          totalrunLive = totalrunLivescore + updaterun;
                          int overOflive =
                              ((liveballlivescore + 1) / 6).truncate();
                          await _firestore
                              .collection('livescore')
                              .document('livescoe')
                              .updateData({
                            'totalrun': totalrunLive,
                            'playerrun2': playerrunupdate2,
                            'totalball': liveballlivescore + 1,
                            'totalover': overOflive,
                            'totaloverdecimal': (liveballlivescore + 1) % 6,
                            'playerball2': (ballplayer2 + 1),
                            'singleRun': 10,
                          });
                        } else {
                          if (_formKeyPlayer2.currentState.validate()) {
                            print('in the gate');
                            //print(team1);
                            final fromPlayerInfo = await _firestore
                                .collection('playerInfo')
                                .where('name', isEqualTo: playername2)
                                .getDocuments();
                            String updaterunInplayerInfoID;
                            String previuosrun, totalPreviuosrun;
                            int previousball;
                            for (var forFromPlayerInfo
                                in fromPlayerInfo.documents) {
                              updaterunInplayerInfoID =
                                  forFromPlayerInfo.documentID;
                              previuosrun = forFromPlayerInfo['liverun'];
                              totalPreviuosrun = forFromPlayerInfo['total run'];
                              previousball = forFromPlayerInfo['liveball'];
                            }
                            int prerun, updaterun, totalrun, fullrun;
                            prerun = int.parse(previuosrun);
                            updaterun = int.parse(run2);
                            totalrun = prerun + updaterun;
                            fullrun = int.parse(totalPreviuosrun) + updaterun;
                            previousball = previousball + 1;

                            await _firestore
                                .collection('playerInfo')
                                .document(updaterunInplayerInfoID)
                                .updateData({
                              'liverun': totalrun.toString(),
                              'total run': fullrun.toString(),
                              'liveball': previousball,
                            });

                            final livescoreID = await _firestore
                                .collection('livescore')
                                .where('player2', isEqualTo: playername2)
                                .getDocuments();
                            String idCollection;
                            int totalrunLivescore;
                            int liveballlivescore, playerrun2, ballplayer2;
                            for (var Oflivescore in livescoreID.documents) {
                              idCollection = Oflivescore.documentID;
                              //print(idCollection);
                              totalrunLivescore = Oflivescore['totalrun'];
                              print(totalrunLivescore);
                              liveballlivescore = Oflivescore['totalball'];
                              //print(liveballlivescore);
                              playerrun2 = Oflivescore['playerrun2'];
                              //print(playerrun2);
                              ballplayer2 = Oflivescore['playerball2'];
                              //print(ballplayer2);
                            }
                            int totalrunLive, playerrunupdate2;
                            playerrunupdate2 = playerrun2 + updaterun;
                            totalrunLive = totalrunLivescore + updaterun;
                            int overOflive =
                                ((liveballlivescore + 1) / 6).truncate();
                            await _firestore
                                .collection('livescore')
                                .document('livescoe')
                                .updateData({
                              'totalrun': totalrunLive,
                              'playerrun2': playerrunupdate2,
                              'totalball': liveballlivescore + 1,
                              'totalover': overOflive,
                              'totaloverdecimal': (liveballlivescore + 1) % 6,
                              'playerball2': (ballplayer2 + 1),
                              'singleRun': updaterun,
                              'selectPlayer': 2,
                            });
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKeynewPlayer1,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      child: Text('For Changing Player 1'),
                      height: 50,
                    ),
                    TextFormField(
                      autovalidate: validatenewplayer1,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter new player1 ',
                      ),
                      onChanged: (value) {
                        newplayer1 = value;
                      },
                    ),
                    FlatButton(
                      color: Colors.lightBlueAccent,
                      child: Text('Change the Player 1'),
                      onPressed: () async {
                        controllerName.clear();
                        //controllerWicket.clear();
                        controllerRun.clear();
                        final livescoreID = await _firestore
                            .collection('livescore')
                            .where('player1', isEqualTo: playername1)
                            .getDocuments(); /**/
                        int newWicket;
                        for (var Oflivescore in livescoreID.documents) {
                          newWicket = Oflivescore['wicket'];
                        }

                        await _firestore
                            .collection('livescore')
                            .document('livescoe')
                            .updateData({
                          'player1': newplayer1,
                          'playerball1': 0,
                          'playerrun1': 0,
                          'wicket': newWicket + 1,
                        });
                      },
                    )
                  ],
                ),
              ),
              Form(
                key: _formKeynewPlayer2,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      child: Text('For Changing Player 2'),
                      height: 50,
                    ),
                    TextFormField(
                      autovalidate: validatenewplayer2,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter new player 2',
                      ),
                      onChanged: (value) {
                        newplayer2 = value;
                      },
                    ),
                    FlatButton(
                      color: Colors.lightBlueAccent,
                      child: Text('Change of the player 2'),
                      onPressed: () async {
                        //controllerWicket1.clear();
                        controllerRun1.clear();
                        controllerName1.clear();

                        final livescoreID = await _firestore
                            .collection('livescore')
                            .where('player2', isEqualTo: playername2)
                            .getDocuments(); /**/
                        int newWicket;
                        for (var Oflivescore in livescoreID.documents) {
                          newWicket = Oflivescore['wicket'];
                        }

                        await _firestore
                            .collection('livescore')
                            .document('livescoe')
                            .updateData({
                          'player2': newplayer2,
                          'playerball2': 0,
                          'playerrun2': 0,
                          'wicket': newWicket + 1,
                        });
                      },
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  String validateName(value) {
    RegExp regExp = RegExp('([A-Z][a-z]+)');
    if (value.isEmpty) {
      return 'Please enter some text';
    } else if (value.length < 3) {
      return 'name atleast consists of 3 character';
    } else if (!regExp.hasMatch(value)) {
      return 'enter valide name and Only character';
    }
    return null;
  }
}
