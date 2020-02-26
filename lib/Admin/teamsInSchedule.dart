import 'package:flutter/material.dart';
import 'package:bvm_primium_league/StreamBuilderss.dart';
class TeamsInSchedule extends StatefulWidget {
  final team11,team2;
  TeamsInSchedule({@required this.team11,@required this.team2});
  @override
  _TeamsInScheduleState createState() => _TeamsInScheduleState();
}

class _TeamsInScheduleState extends State<TeamsInSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teams In Schedule'),
      ),
      body:Container(
        child: ScheduleTeam1(team1: widget.team11,team2: widget.team2,),
      )
    );
  }
}
