import 'package:flutter/material.dart';

import './Login.dart';
class PreLogin extends StatelessWidget{

  final scrObj;
  PreLogin(this.scrObj);

  Widget getWidget(){
    Widget screen;
    if(this.scrObj['currScreen'] == "login"){
      screen = Login(this.scrObj['launchScreen'],this.scrObj['setUserdata']);
    }
    return screen;
  }
  Widget build(BuildContext context){
    return Container(child: getWidget(),
    );
  }
}