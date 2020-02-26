import 'package:flutter/material.dart';
import 'package:bvm_primium_league/screens/singlePlayerCard.dart';
import 'package:bvm_primium_league/StreamBuilderss.dart';

class ListOfPlayerInTeamAdmin extends StatefulWidget {
  static String id='ListOfPlayerInTeamAdmin';
  ListOfPlayerInTeamAdmin({@required this.teamname});
  final teamname;
  @override
  _ListOfPlayerInTeamAdminState createState() => _ListOfPlayerInTeamAdminState();
}

class _ListOfPlayerInTeamAdminState extends State<ListOfPlayerInTeamAdmin> {
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
