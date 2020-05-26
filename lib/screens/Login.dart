import 'package:flutter/material.dart';
import 'package:nammakada/modules/Login/loginm.dart';

class Login extends StatelessWidget {
  
  final launchScreen;
  final setUserData;
  Login(this.launchScreen,this.setUserData);

  @override
  Widget build(BuildContext context) {
    return Container(child:LoginM(launchScreen,setUserData));
  }
}
