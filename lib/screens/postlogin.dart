import 'package:flutter/material.dart';

import './dashboard.dart';
import './customers.dart';
import './settings.dart';
class PostLogin extends StatelessWidget{

  final scrObj;
  PostLogin(this.scrObj);

  Widget getWidget(){
    Widget screen;
    if(this.scrObj['currScreen'] == "dashboard"){
      screen = Dashboard(this.scrObj['launchScreen']);
    }else if(this.scrObj['currScreen'] == "Add Cust"){
      print("Add Cust");
      screen = Customers();
    }else if(this.scrObj['currScreen'] == "customerlist"){

    }else if(this.scrObj['currScreen'] == "additems"){

    }else if(this.scrObj['currScreen'] == "addgst"){

    }else if(this.scrObj['currScreen'] == "geninvoice"){

    }else if(this.scrObj['currScreen'] == "makecotation"){

    }else if(this.scrObj['currScreen'] == "Settings"){
      screen = Settings(this.scrObj['launchScreen'],this.scrObj['userData']);
    }
    return screen;
  }
  Widget build(BuildContext context){
    return Container(child: getWidget(),
    );
  }
}