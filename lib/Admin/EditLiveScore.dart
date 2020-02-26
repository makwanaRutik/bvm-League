import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _formKey = GlobalKey<FormState>();
final _firestore = Firestore.instance;

class EditLiveScore extends StatefulWidget {
  static String id = 'EditLiveScoreid';
  @override
  _EditLiveScoreState createState() => _EditLiveScoreState();
}

class _EditLiveScoreState extends State<EditLiveScore> {
  @override
  String totalover;
  String team1,
      team2,
      player1,
      player2,
      date,
      time,
      venue,
      tosswonbyteam,
      series;
  String totalrun, playerrun1, playerrun2, playerball1, playerball2, wicket;
  Text getText(String text) {
    return Text(text);
  }

//  TextFormField getFormField(String text,String  firebaseValue) {
//    return TextFormField(
//      validator: (value) {
//        if (value.isEmpty) {
//          return 'Please enter some text';
//        }
//        return null;
//      },
//      decoration: InputDecoration(
//        hintText: '$text',
//      ),
//      onChanged: (value) {
//        firebaseValue = value;
//        print(firebaseValue);
//      },
//    );
//  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('liveScore Edit '),
          centerTitle: true,
        ),
        body: Container(
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                getText('Team 1'),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter team 1 Name',
                  ),
                  onChanged: (value) {
                    team1 = value;
                  },
                ),
                //getFormField('Enter team 1 Name', team1),
                getText('team 2'),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter team 2 Name',
                  ),
                  onChanged: (value) {
                    team2 = value;
                  },
                ),
                //getFormField('Enter 2nd team', team2),
                getText('player 1'),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter player 1 Name',
                  ),
                  onChanged: (value) {
                    player1 = value;
                  },
                ),
                //getFormField('Enter 1st player', player1),
                getText('player 2'),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter  player 2 Name',
                  ),
                  onChanged: (value) {
                    player2 = value;
                  },
                ),
                //getFormField('Enter 2nd player', player2),
//                getText('Total over'),
//                TextFormField(
//                  validator: (value) {
//                    if (value.isEmpty) {
//                      return 'Please enter some text';
//                    }
//                    return null;
//                  },
//                  decoration: InputDecoration(
//                    hintText: 'Enter total over',
//                  ),
//                  onChanged: (value) {
//                    totalover = value;
//
//                  },
//                ),
//                //getFormField('Enter Total over', totalover),
//                getText('Player 1 balls'),
//                TextFormField(
//                  validator: (value) {
//                    if (value.isEmpty) {
//                      return 'Please enter some text';
//                    }
//                    return null;
//                  },
//                  decoration: InputDecoration(
//                    hintText: 'Enter player  1 ball',
//                  ),
//                  onChanged: (value) {
//                    playerball1 = value;
//
//                  },
//                ),
//                //getFormField('Enter player 1 ball', playerball1),
//                getText('player 2 ball'),
//                TextFormField(
//                  validator: (value) {
//                    if (value.isEmpty) {
//                      return 'Please enter some text';
//                    }
//                    return null;
//                  },
//                  decoration: InputDecoration(
//                    hintText: 'Enter player 2 ball',
//                  ),
//                  onChanged: (value) {
//                    playerball2 = value;
//
//                  },
//                ),
//                //getFormField('Enter 2nd player ball', playerball2),
//                getText('Player 1 Run'),
//                TextFormField(
//                  validator: (value) {
//                    if (value.isEmpty) {
//                      return 'Please enter some text';
//                    }
//                    return null;
//                  },
//                  decoration: InputDecoration(
//                    hintText: 'Enter player 1 run',
//                  ),
//                  onChanged: (value) {
//                    playerrun1 = value;
//
//                  },
//                ),
//                //getFormField('Enter player 1 run', playerrun1),
//                getText('player 2 Run'),
//                TextFormField(
//                  validator: (value) {
//                    if (value.isEmpty) {
//                      return 'Please enter some text';
//                    }
//                    return null;
//                  },
//                  decoration: InputDecoration(
//                    hintText: 'Enter player 2 run',
//                  ),
//                  onChanged: (value) {
//                    playerrun2 = value;
//
//                  },
//                ),
//                //getFormField('Enter 2nd player 2 run', playerrun2),
//                getText('wicket'),
//                TextFormField(
//                  validator: (value) {
//                    if (value.isEmpty) {
//                      return 'Please enter some text';
//                    }
//                    return null;
//                  },
//                  decoration: InputDecoration(
//                    hintText: 'Enter wicket',
//                  ),
//                  onChanged: (value) {
//                    wicket = value;
//
//                  },
//                ),
//                //getFormField('Enter wicket', wicket),
//                getText('Total Run'),/**/
//                TextFormField(
//                  validator: (value) {
//                    if (value.isEmpty) {
//                      return 'Please enter some text';
//                    }
//                    return null;
//                  },
//                  decoration: InputDecoration(
//                    hintText: 'Enter total run',
//                  ),
//                  onChanged: (value) {
//                    totalrun = value;
//
//                  },
//                ),
                //getFormField('Enter total run', totalrun),
                getText('Venue'),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter venue',
                  ),
                  onChanged: (value) {
                    venue = value;
                  },
                ),
                //getFormField('Enter Venue', venue),
                getText('Date'),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Date(ie 4 March 2020)',
                  ),
                  onChanged: (value) {
                    date = value;
                  },
                ),
                // getFormField('Enter Date(ie 4 March 2020)', date),
                getText('Time'),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration:
                      InputDecoration(hintText: 'Enter time(ie 1:00 AM)'),
                  onChanged: (value) {
                    time = value;
                  },
                ),
                //getFormField('Enter time(ie 1:00 AM)', time),
                getText('Toss Won team'),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration:
                      InputDecoration(hintText: 'Enter toss winning team name'),
                  onChanged: (value) {
                    tosswonbyteam = value;
                  },
                ),
                //getFormField('Enter Winning toss team name', tosswonbyteam),
                getText('Series'),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: 'Enter Series Year'),
                  onChanged: (value) {
                    series = value;
                  },
                ),
                //getFormField('Enter year of the Series', series),
                FlatButton(
                  color: Colors.lightBlueAccent,
                  child: Text('Submit'),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      print('in the gate');
                      //print(team1);
                      await _firestore
                          .collection('livescore')
                          .document('livescoe')
                          .updateData({
                        'team1': team1,
                        'team2': team2,
                        'playerrun1': 0,
                        'playerrun2': 0,
                        'playerball1': 0,
                        'playerball2': 0,
                        'tosswonbyteam': tosswonbyteam,
                        'totalrun': 0,
                        'totalover': 0,
                        'totaloverdecimal': 0,
                        'venue': venue,
                        'time': time,
                        'date': date,
                        'series': series,
                        'player1': player1,
                        'player2': player2,
                        'wicket': 0,
                        'totalball': 0,
                        'singleRun':0,
                        'selectPlayer':1,
                      });

                      Navigator.pop(context);
                    }
                    //Navigator.pushNamed(context, playerInfo.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
