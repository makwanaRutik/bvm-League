import 'package:flutter/material.dart';


class DeveloperAdmin extends StatefulWidget {
  static String id='Developer_screen Admin';
  @override
  _DeveloperAdminState createState() => _DeveloperAdminState();
}

class _DeveloperAdminState extends State<DeveloperAdmin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/rutik.jpg'),
              ),
              Text(
                'Makwana Rutik',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  //fontFamily: 'pacifico',
                ),
              ),
              Text(
                'Web Developer',
                style: TextStyle(
                  //fontFamily: 'Source Sans Pro',
                  fontSize: 25,
                  color: Colors.teal.shade900,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
                width: 230,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                //padding: EdgeInsets.all(10),
                child: ListTile(
                  leading:Icon(
                    Icons.phone,
//size: 50,
                    color: Colors.teal.shade900,
                  ) ,
                  title:Text(
                    '+91 968 794 4132',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal.shade900,
                      //fontFamily: 'Source Sans Pro',
                    ),
                  ) ,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical:10,horizontal: 25 ),
                //padding: EdgeInsets.all(10),
                child: ListTile(
                  leading: Icon(Icons.email,
                    color: Colors.teal.shade900,


                  ),
                  title: Text(
                    'makwanarutik85@gmail.com',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal.shade900,
                      //fontFamily: 'Source Sans Pro',
                    ),
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



