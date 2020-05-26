import 'package:flutter/material.dart';
import 'package:nammakada/Plugins/Plugins.dart';

import 'package:nammakada/Queries/processQueries.dart';

class LoginM extends StatelessWidget {
  final launchScreen;
  final setUserdata;
  LoginM(this.launchScreen,this.setUserdata);
  @override
  Widget build(BuildContext context) {
    return LoginMState(launchScreen,setUserdata);
  }
}

class LoginMState extends StatefulWidget {
  final launchScreen;
  final setUserdata;
  LoginMState(this.launchScreen,this.setUserdata);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginMState> {
  Map<String, dynamic> usrrslt;
  String userId;
  String password;
  String checkUserId;
  String checkpassword;
  bool isLoggedin = false;
  bool isBioauthEnabled = false;

  final userIdController = TextEditingController();

  final passwordController = TextEditingController();

  validateUser() async {
    bool rslt = false;
    password = passwordController.text;
    if (isLoggedin) {
      if (checkUserId == userId && password == checkpassword) {
        usrrslt = await Plugins.instance.excecute({
          'reqId': "USERS",
          'query':
              'UPDATE TB_USERS SET LAST_LOGIN = "Madhu" WHERE USER_ID = "${userId}";',
          'entity': "Customer"
        });
      } else {}
    } else {
      userId = userIdController.text;
      usrrslt = await Plugins.instance.excecute({
        'reqId': "SQL",
        'query':
            'INSERT INTO TB_USERS("USER_ID","PASS","BIO_AUTH")values("${userId}","${password}","false")',
        'entity': "Customer"
      });
    }

    if (usrrslt['status'] != false) {
      widget.setUserdata(userId);
      widget.launchScreen(false, "dashboard");
    } else {}
  }

  checkUserPresent() async {
    await ProcessQueries().checktablePresent();
    bool rslt = false;
    usrrslt = await Plugins.instance.excecute({
      'reqId': "SQL",
      'query': 'SELECT * FROM TB_USERS',
      'entity': "Customer"
    });
    if (usrrslt['status'] != false && usrrslt['resp'].length > 0) {
      userId = usrrslt['resp'][0]['USER_ID'];
      setState(() {
        isLoggedin = true;
        isBioauthEnabled =
            usrrslt['resp'][0]['BIO_AUTH'] == "true" ? true : false;
      });
    } else {}
    return rslt;
  }

  Widget getreguserContent() {
    return Container(
      child: Text("Hi " + userId),
    );
  }

  checkbioAuth() async {
    Map<String, dynamic> rslt =
        await Plugins.instance.excecute({"reqId": "BIOAUTH"});

    if (rslt['status'] && rslt['resp']['status']) {
      widget.launchScreen(false, "dashboard");
    }
  }

  Widget getBioAUthenabled() {
    return GestureDetector(
        onTap: () {
          checkbioAuth();
        },
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor)),
            child: Row(
              children: <Widget>[Icon(Icons.fingerprint), Text("Finger Print")],
            )));
  }

  Widget getnwuserContent() {
    return Container(
      child: TextFormField(
        controller: userIdController,
        decoration: InputDecoration(
          hintText: 'Enter user ID',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    checkUserPresent();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Card(
      child: Container(
        width: 350,
        height: 350,
        padding: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Container(
            child: Icon(
              Icons.supervised_user_circle,
              size: 80,
              color: Theme.of(context).primaryColor,
            ),
          ),
          isLoggedin ? getreguserContent() : getnwuserContent(),
          SizedBox(
            height: 20,
          ),
          Container(
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Enter Password',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                validateUser();
              },
              child: Text(
                'Login',
                style: TextStyle(
                    fontFamily: 'Opensans',
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                    color: Theme.of(context).accentColor,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
          isBioauthEnabled ? getBioAUthenabled() : Text(""),
        ]),
      ),
    )));
  }
}
