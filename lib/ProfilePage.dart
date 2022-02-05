import 'package:cyanodoc_test/auth.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  @override

  final Authservice _auth = Authservice();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
            actions: <Widget>[
              FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('logout'),
              onPressed:() async {
                    await _auth.signOut();

              },
              ),

        ],
      ),

    );
  }
}