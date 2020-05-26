import 'package:flutter/material.dart';
import './screens/postlogin.dart';
import './Queries/processQueries.dart';
import 'package:nammakada/screens/prelogin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.purple, 
          accentColor: Colors.yellowAccent,
          primaryColorLight:Colors.purple[300],fontFamily: 'OpenSans'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String currScreen = "login";
  bool isLogoutVisible = false;
  bool isHomeVisible = false;
  bool prelogin = true;
  String userId;

  launchScreen(isprelogin,scrname) {
    setState(() {
      currScreen = scrname;
      prelogin = isprelogin;
      if(scrname == "dashboard"){
        isHomeVisible = false;
        isLogoutVisible = true;
      }else if(prelogin) {
        isHomeVisible = false;
        isLogoutVisible = false;
      }else{
        isLogoutVisible = false;
        isHomeVisible = true;
      }
    });
  }
  setUserdata(luserId){
    userId = luserId;
  }

  getScrObj(){
    Map<String,dynamic> scrobj = {
      'launchScreen':launchScreen,
      'currScreen':currScreen,
      'setUserData':setUserdata,
      'userData':{
        'userId':"",
      }
    };
    return scrobj;
  }

  Widget getLandingPage() {
    return prelogin ? PreLogin(getScrObj()) : PostLogin(getScrObj());
  }
  onLoad() async{
    await ProcessQueries().checktablePresent();

  }
@override
  void initState() {
    super.initState();
    //onLoad();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(    
          currScreen,
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            
            
          ),
        ),
        actions: <Widget>[
            // action button
            Opacity(
              child:IconButton(
              icon:Icon(Icons.home),
              onPressed: () {
                  launchScreen(false,"dashboard");              
                },
            ),
            opacity: isHomeVisible ? 1 : 0,),
            Opacity(
              child:IconButton(
              icon:Icon(Icons.power_settings_new),
              onPressed: () {
                  launchScreen(true,"login");              
                },
            ),
            opacity: isLogoutVisible ? 1 : 0,)
            ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: getLandingPage(),
    );
  }
}
