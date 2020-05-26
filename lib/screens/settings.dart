import 'package:flutter/material.dart';
import 'package:nammakada/modules/settings/settingsmodule.dart';

class Settings extends StatelessWidget {
  final launchScreen;
  final userData;
  Settings(this.launchScreen,this.userData);

  validateUser() {
    launchScreen(false,"dashboard");
  }

  Widget build(BuildContext context) {
    return (Column(children: <Widget>[
      Container(
        child:SettingsM(this.userData['userId']),
          ),
    ]));
  }
}
