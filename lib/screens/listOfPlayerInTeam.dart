import 'package:flutter/material.dart';
import 'package:bvm_primium_league/screens/singlePlayerCard.dart';
import 'package:bvm_primium_league/StreamBuilderss.dart';

class ListOfPlayerInTeam extends StatefulWidget {
  static String id='ListOfPlayerInTeam';
  ListOfPlayerInTeam({@required this.teamname});
  final teamname;
  @override
  _ListOfPlayerInTeamState createState() => _ListOfPlayerInTeamState();
}

class _ListOfPlayerInTeamState extends State<ListOfPlayerInTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Team Player',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      body: StreamPlayerInTeam(teamname: widget.teamname),
    );
  }
}
