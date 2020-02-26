import 'package:firebase_auth/firebase_auth.dart';
import 'package:bvm_primium_league/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bvm_primium_league/StreamBuilderss.dart';
import 'package:bvm_primium_league/Admin/EditLiveScore.dart';
final _firestore=Firestore.instance;


class LiveScoreAdmin extends StatefulWidget {


  static String id = 'live_score';
  @override
  _LiveScoreAdminState createState() => _LiveScoreAdminState();
}

class _LiveScoreAdminState extends State<LiveScoreAdmin> {
//  String totalover;
//  String team1,
//      team2,
//      player1,
//      player2,
//      date,
//      time,
//      venue,
//      tosswonbyteam,
//      series;
//  String totalrun, playerrun1, playerrun2, playerball1, playerball2, wicket;
@override
  void initState()  {

    super.initState();
   // getData();

  }
//  void getData() async
//  {
//   final data=await _firestore.collection('livescore').getDocuments();
//   if(data!=null)
//     {
//       for(var fordata in data.documents)
//         {
//            team1=fordata['team1'];
//            team2=fordata['team2'];
//            playerrun1=fordata['playerrun1'];
//            playerrun2=fordata['playerrun2'];
//            playerball1=fordata['playerrun2'];
//            playerball2=fordata['playerball2'];
//            tosswonbyteam=fordata['tosswonbyteam'];
//            totalrun=fordata['totalrun'];
//            totalover=fordata['totalover'];
//            venue=fordata['venue'];
//            time=fordata['time'];
//            date=fordata[ 'date'];
//            series=fordata[ 'series'];
//            player1=fordata['player1'];
//            player2=fordata['player2'];
//            wicket=fordata['wicket'];
//
//
//         }
//     }
//  }
  @override
  Widget build(BuildContext context) {

    return EditDataAdmin();
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
