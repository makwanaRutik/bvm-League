import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bvm_primium_league/Admin/singlePlayerCard.dart';
import 'package:bvm_primium_league/screens/teamCard.dart';
import 'screens/singlePlayerCard.dart';
import 'package:bvm_primium_league/Admin/editRunOfThePlayer.dart';
import 'package:bvm_primium_league/Admin/roundedSchedule.dart';

final _firestore = Firestore.instance;

class StreamTeams extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('Teams').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final teamNames = snapshot.data.documents;
        List<SingleTeamCard> teamCards = [];
        print('heyy');
        for (var asTameNames in teamNames) {
          final teamNameFromStream = asTameNames.data['teamname'];
          print('team loop');

          // final currentUser = loggedInUser.email;

          final teamCard = SingleTeamCard(teamName: teamNameFromStream);

          teamCards.add(teamCard);
        }
        return ListView(
          reverse: false,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: teamCards,
        );
      },
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('playerInfo').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents;
        List<SinglePalyerCard> playerCards = [];
        // print('palyer');

        for (var message in messages) {
          final name = message.data['name'];
          final branch = message.data['branch'];
          final team = message.data['team'];
          print('in loop');

          // final currentUser = loggedInUser.email;

          final playerCrad =
              SinglePalyerCard(team: team, branch: branch, name: name);

          playerCards.add(playerCrad);
        }
        return ListView(
          reverse: false,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: playerCards,
        );
      },
    );
  }
}

class StreamPlayerInTeam extends StatelessWidget {
  StreamPlayerInTeam({@required this.teamname});
  final teamname;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('playerInfo')
          .where('team', isEqualTo: teamname)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents;
        List<SinglePalyerCard> playerCards = [];
        // print('palyer');

        for (var message in messages) {
          final name = message.data['name'];
          final branch = message.data['branch'];
          final team = message.data['team'];
          print('in loop');

          // final currentUser = loggedInUser.email;

          final playerCrad =
              SinglePalyerCard(team: team, branch: branch, name: name);

          playerCards.add(playerCrad);
        }
        return ListView(
          reverse: false,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: playerCards,
        );
      },
    );
  }
}

class MessagesStreamAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('playerInfo').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents;
        List<SinglePalyerCardAdmin> playerCards = [];
        // print('palyer');

        for (var message in messages) {
          final name = message.data['name'];
          final branch = message.data['branch'];
          final team = message.data['team'];
          print('in loop');

          // final currentUser = loggedInUser.email;

          final playerCrad =
              SinglePalyerCardAdmin(team: team, branch: branch, name: name);

          playerCards.add(playerCrad);
        }
        return ListView(
          reverse: false,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: playerCards,
        );
      },
    );
  }
}

String Singlerun1, Singlerun2, Singlerun3, Singlerun4, Singlerun5, Singlerun6;

class EditDataAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('livescore').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final data = snapshot.data.documents;
        //List<SinglePalyerCardAdmin> playerCards = [];
        // print('palyer');

        List<runRoundedIcon> runRoundedIcons = [];
        Color getColor(String run) {
          Color colour;
          if (run == '1' || run == '2' || run == '3' || run == '0') {
            colour = Colors.lightBlueAccent;
          } else if (run == '4' || run == '6' || run == '5') {
            colour = Colors.purpleAccent;
          } else if (run == '10') {
            colour = Colors.red;
          }
          return colour;
        }

        String getText(String run) {
          String runn;
          if (run == '1' ||
              run == '0' ||
              run == '2' ||
              run == '3' ||
              run == '4' ||
              run == '5' ||
              run == '6') {
            runn = run;
          } else if (run == '10') {
            runn = 'w';
          }
          return runn;
        }

        List<runRoundedIcon> getrunIcons(String decimalover) {
          runRoundedIcons.clear();

          if (decimalover == '1') {
            var newicon1 = runRoundedIcon(
                run: getText(Singlerun1), colour: getColor(Singlerun1));
            runRoundedIcons.add(newicon1);
          } else if (decimalover == '2') {
            var newicon1 = runRoundedIcon(
                run: getText(Singlerun1), colour: getColor(Singlerun1));
            var newicon2 = runRoundedIcon(
                run: getText(Singlerun2), colour: getColor(Singlerun2));
            runRoundedIcons.add(newicon1);
            runRoundedIcons.add(newicon2);
          } else if (decimalover == '3') {
            var newicon1 = runRoundedIcon(
                run: getText(Singlerun1), colour: getColor(Singlerun1));
            var newicon2 = runRoundedIcon(
                run: getText(Singlerun2), colour: getColor(Singlerun2));
            var newicon3 = runRoundedIcon(
                run: getText(Singlerun3), colour: getColor(Singlerun3));
            runRoundedIcons.add(newicon1);
            runRoundedIcons.add(newicon2);
            runRoundedIcons.add(newicon3);
          } else if (decimalover == '4') {
            var newicon1 = runRoundedIcon(
                run: getText(Singlerun1), colour: getColor(Singlerun1));
            var newicon2 = runRoundedIcon(
                run: getText(Singlerun2), colour: getColor(Singlerun2));
            var newicon3 = runRoundedIcon(
                run: getText(Singlerun3), colour: getColor(Singlerun3));
            var newicon4 = runRoundedIcon(
                run: getText(Singlerun4), colour: getColor(Singlerun4));
            runRoundedIcons.add(newicon1);
            runRoundedIcons.add(newicon2);
            runRoundedIcons.add(newicon3);
            runRoundedIcons.add(newicon4);
          } else if (decimalover == '5') {
            var newicon1 = runRoundedIcon(
                run: getText(Singlerun1), colour: getColor(Singlerun1));
            var newicon2 = runRoundedIcon(
                run: getText(Singlerun2), colour: getColor(Singlerun2));
            var newicon3 = runRoundedIcon(
                run: getText(Singlerun3), colour: getColor(Singlerun3));
            var newicon4 = runRoundedIcon(
                run: getText(Singlerun4), colour: getColor(Singlerun4));
            var newicon5 = runRoundedIcon(
                run: getText(Singlerun5), colour: getColor(Singlerun5));
            runRoundedIcons.add(newicon1);

            runRoundedIcons.add(newicon2);

            runRoundedIcons.add(newicon3);
            runRoundedIcons.add(newicon4);
            runRoundedIcons.add(newicon5);
          } else if (decimalover == '0') {
            var newicon1 = runRoundedIcon(
                run: getText(Singlerun1), colour: getColor(Singlerun1));
            var newicon2 = runRoundedIcon(
                run: getText(Singlerun2), colour: getColor(Singlerun2));
            var newicon3 = runRoundedIcon(
                run: getText(Singlerun3), colour: getColor(Singlerun3));
            var newicon4 = runRoundedIcon(
                run: getText(Singlerun4), colour: getColor(Singlerun4));
            var newicon5 = runRoundedIcon(
                run: getText(Singlerun5), colour: getColor(Singlerun5));
            var newicon6 = runRoundedIcon(
                run: getText(Singlerun6), colour: getColor(Singlerun6));
            runRoundedIcons.add(newicon1);
            runRoundedIcons.add(newicon2);
            runRoundedIcons.add(newicon3);
            runRoundedIcons.add(newicon4);
            runRoundedIcons.add(newicon5);
            runRoundedIcons.add(newicon6);
          }
          return runRoundedIcons;
        }

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
        String selectPlayer,
            totaloverdecimal,
            totalrun,
            playerrun1,
            playerrun2,
            playerball1,
            playerball2,
            singleRun,
            wicket;
        Color selectedPlayercolour;
        Color getselectedPlayercolour1() {
          if (selectPlayer == player1) {
            selectedPlayercolour = Colors.green.shade500;
            return selectedPlayercolour;
          } else if (selectPlayer != player1) {
            selectedPlayercolour = Colors.black;
            return selectedPlayercolour;
          }
        }

        Color getselectedPlayercolour2() {
          if (selectPlayer == player2) {
            selectedPlayercolour = Colors.green.shade500;
            return selectedPlayercolour;
          } else if (selectPlayer != player2) {
            selectedPlayercolour = Colors.black;
            return selectedPlayercolour;
          }
        }

        String getPlayerRunText() {
          if (int.parse(singleRun) >= 0 && int.parse(singleRun) <= 6) {
            return '$singleRun Run From $selectPlayer';
          } else if (int.parse(singleRun) == 10) {
            return '$selectPlayer OUT!!!';
          }
        }

        int selectPlayernum;
        for (var fordata in data) {
          print('in loop');
          team1 = fordata.data['team1'];
          team2 = fordata.data['team2'];
          playerrun1 = fordata.data['playerrun1'].toString();
          playerrun2 = fordata.data['playerrun2'].toString();
          playerball1 = fordata.data['playerball1'].toString();
          playerball2 = fordata.data['playerball2'].toString();
          tosswonbyteam = fordata.data['tosswonbyteam'];
          totaloverdecimal = fordata.data['totaloverdecimal'].toString();
          totalrun = fordata.data['totalrun'].toString();
          totalover = fordata.data['totalover'].toString();
          venue = fordata.data['venue'];
          time = fordata.data['time'];
          date = fordata.data['date'];
          series = fordata.data['series'];
          player1 = fordata.data['player1'];
          player2 = fordata.data['player2'];
          wicket = fordata.data['wicket'].toString();
          singleRun = fordata.data['singleRun'].toString();
          selectPlayernum = fordata.data['selectPlayer'];
          if (totaloverdecimal == '1') {
            Singlerun1 = singleRun;
          } else if (totaloverdecimal == '2') {
            Singlerun2 = singleRun;
          } else if (totaloverdecimal == '3') {
            Singlerun3 = singleRun;
          } else if (totaloverdecimal == '4') {
            Singlerun4 = singleRun;
          } else if (totaloverdecimal == '5') {
            Singlerun5 = singleRun;
          } else if (totaloverdecimal == '0') {
            Singlerun6 = singleRun;
          }
          if (selectPlayernum == 1) {
            selectPlayer = player1;
          } else if (selectPlayernum == 2) {
            selectPlayer = player2;
          }
          // final currentUser = loggedInUser.email;

        }
        return Scaffold(
          appBar: AppBar(
            title: Text('Live Score'),
            centerTitle: true,
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
                          '$team1 vs $team2',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
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
                      '$team1: $totalrun/$wicket in $totalover.$totaloverdecimal',
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
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.only(left: 25, right: 5),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage('images/player.png'),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 12,
                          child: Container(
                            child: Text(
                              '$player1',
                              style: TextStyle(
                                color: getselectedPlayercolour1(),
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            '$playerrun1($playerball1)',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: getselectedPlayercolour1(),
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
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
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.only(left: 25, right: 5),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage('images/player.png'),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 12,
                          child: Container(
                            child: Text(
                              '$player2',
                              style: TextStyle(
                                color: getselectedPlayercolour2(),
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: Text(
                              '$playerrun2($playerball2)',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 25,
                                color: getselectedPlayercolour2(),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
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
                          'Over:$totalover.$totaloverdecimal',
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
                      children: getrunIcons(totaloverdecimal),
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
                      getPlayerRunText(),
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
                                padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
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
                                padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
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
                                padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
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
                                padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
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
                                padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
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
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                  width: double.infinity,
                                  //width: 150,
                                  height: 60,
                                  color: Colors.white,
                                  child: Text(
                                    '$team1 VS $team2 ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                width: double.infinity,
                                height: 60,
                                color: Colors.white,
                                child: Text(
                                  '$date  , $time',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                height: 60,
                                width: double.infinity,
                                color: Colors.white,
                                child: Text(
                                  '$venue',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
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
                                  '$team1 won the toss!!!',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
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
                                  '$series',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
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
      },
    );
  }
}

class runRoundedIcon extends StatelessWidget {
  runRoundedIcon({@required this.run, @required this.colour});
  final run;
  final colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: CircleAvatar(
        backgroundColor: colour,
        radius: 15,
        child: Text(
          '$run',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class StreamOfSchelude extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('schedule').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final teamNames = snapshot.data.documents;
        List<RoundedSchedule> sheduleCards = [];
        print('heyy');
        for (var asTameNames in teamNames) {
          final team1 = asTameNames.data['team1'];
          final team2 = asTameNames.data['team2'];
          final time = asTameNames.data['time'];
          final date = asTameNames.data['date'];
          // final currentUser = loggedInUser.email;

          final scheduleCard = RoundedSchedule(
              time: time, team1: team1, team2: team2, date: date);

          sheduleCards.add(scheduleCard);
        }
        return ListView(
          reverse: false,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: sheduleCards,
        );
      },
    );
  }
}

class ScheduleTeam1 extends StatelessWidget {
  final team1, team2;
  ScheduleTeam1({@required this.team1, @required this.team2});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('Teams')
          .where("teamname", whereIn: [team1, team2]).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final teamNames = snapshot.data.documents;
        List<SingleTeamCard> teamCards = [];
        print('heyy');
        for (var asTameNames in teamNames) {
          final teamNameFromStream = asTameNames.data['teamname'];
          print(teamNameFromStream); /**/
          print('team loop');

          // final currentUser = loggedInUser.email;

          final teamCard = SingleTeamCard(teamName: teamNameFromStream);

          teamCards.add(teamCard);
          print('heyy');
        }
        return ListView(
          reverse: false,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: teamCards,
        );
      },
    );
  }
}
