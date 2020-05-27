import 'package:flutter/material.dart';
import 'package:nammakada/modules/Login/loginm.dart';

class Login extends StatelessWidget {
  
  final launchScreen;
  final setUserdata;
  Login(this.launchScreen,this.setUserdata);

  @override
  Widget build(BuildContext context) {
    return LoginM(launchScreen,setUserdata);
  }
}
