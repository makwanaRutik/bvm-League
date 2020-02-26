import 'package:bvm_primium_league/screens/chat_screen.dart';
import 'package:bvm_primium_league/screens/developer.dart';
import 'package:bvm_primium_league/screens/live_score.dart';
import 'package:bvm_primium_league/screens/login_screen.dart';
import 'package:bvm_primium_league/screens/registration_screen.dart';
import 'package:bvm_primium_league/screens/teamCard.dart';
import 'package:bvm_primium_league/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:bvm_primium_league/screens/addPlayer.dart';
import 'package:bvm_primium_league/screens/my_home_page.dart';
import 'dart:developer';
import 'player/insertUpdatePlayaerDatabyPlayer.dart';
import 'screens/listOfPlayerInTeam.dart';
import 'package:bvm_primium_league/StreamBuilderss.dart';
import 'package:bvm_primium_league/screens/riya.dart';
import 'package:bvm_primium_league/screens/dashboard.dart';
import 'package:bvm_primium_league/screens/listview.dart';
import 'package:bvm_primium_league/screens/playerInfo.dart';
import 'package:bvm_primium_league/screens/queryPlayerInfo.dart';
import 'package:bvm_primium_league/Admin/loginAdmin.dart';
import 'package:bvm_primium_league/player/loginPlayer.dart';
import 'package:bvm_primium_league/Admin/addPlayer.dart';
import 'package:bvm_primium_league/Admin/developer.dart';
import 'package:bvm_primium_league/Admin/listOfPlayerInTeam.dart';
import 'package:bvm_primium_league/Admin/listview.dart';
import 'package:bvm_primium_league/Admin/live_score.dart';
import 'package:bvm_primium_league/Admin/loginAdmin.dart';
import 'package:bvm_primium_league/Admin/my_home_page.dart';
import 'package:bvm_primium_league/Admin/playerInfo.dart';
import 'package:bvm_primium_league/Admin/queryPlayerInfo.dart';

import 'package:bvm_primium_league/Admin/singlePlayerCard.dart';
import 'package:bvm_primium_league/Admin/teamCard.dart';
import 'package:bvm_primium_league/Admin/EditLiveScore.dart';
import 'package:bvm_primium_league/Admin/editRunOfThePlayer.dart';
import 'package:bvm_primium_league/Admin/addSchedule.dart';
import 'package:bvm_primium_league/demo.dart';
import 'package:bvm_primium_league/Admin/schedule.dart';

void main() {
  runApp(BvmApp());
}

class BvmApp extends StatefulWidget {
  @override
  _BvmAppState createState() => _BvmAppState();
}

class _BvmAppState extends State<BvmApp> {
  final appTitle = 'BVM Premium Leauge';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      initialRoute: MyHomePageAdmin.id,
      /**/
      routes: {
        MyHomePage.id: (context) => MyHomePage(
              title: appTitle,
            ),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LiveScore.id: (context) => LiveScore(),
        Developer.id: (context) => Developer(),
        DashboardPage.id: (context) => DashboardPage(),
        FlutterTabss.id: (context) => FlutterTabss(),
        playerInfo.id: (context) => playerInfo(),
        ChatScreen.id: (context) => ChatScreen(),
        ListOfPlayerInTeam.id: (context) => ListOfPlayerInTeam(),
        AddPlayer.id: (context) => AddPlayer(),
        LoginScreenPlayer.id: (context) => LoginScreenPlayer(),
        LoginScreenAdmin.id: (context) => LoginScreenAdmin(),
        AddPlayerAdmin.id: (context) => AddPlayerAdmin(),
        DeveloperAdmin.id: (context) => DeveloperAdmin(),
        //AddPlayerAdmin.id: (context) => ListOfPlayerInTeamAdmin(teamname: null),
        FlutterTabssAdmin.id: (context) => FlutterTabssAdmin(),
        LiveScoreAdmin.id: (context) => LiveScoreAdmin(),
        MyHomePageAdmin.id: (context) => MyHomePageAdmin(
              title: appTitle,
            ),
        EditRunOfThePlayer.id: (context) => EditRunOfThePlayer(),
        //InsertUpadtePlayerData.id:(context)=>InsertUpadtePlayerData(),
        //PlayerQueryInfoPageAdmin.id: (context) => PlayerQueryInfoPage(),
        // SinglePalyerCardAdmin.id: (context) => SingleTeamCardAdmin(),
        AddSchedule.id: (context) => AddSchedule(),
        EditLiveScore.id: (context) => EditLiveScore(),
        MyApp.id:(context)=>MyApp(),
        //playerInfos.id:(context)=>playerInfos(),
        Schedule.id: (context) => Schedule(),
        //Riya.id:(context)=>Riya(),
      },
    );
  }
}
