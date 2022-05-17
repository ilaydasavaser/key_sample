import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  profil createState() => profil();
}

class profil extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Profil",
        style: TextStyle(color: Colors.white),
      )),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
