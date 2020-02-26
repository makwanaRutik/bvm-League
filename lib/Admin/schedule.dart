import'package:flutter/material.dart';
import 'package:bvm_primium_league/StreamBuilderss.dart';
class Schedule extends StatefulWidget {
  static String id='Scheduleidabcunique';
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Schedules'),
      centerTitle: true,),
      body:StreamOfSchelude(),
    );
  }
}
