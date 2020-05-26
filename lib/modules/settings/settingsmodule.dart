import 'package:flutter/material.dart';
import 'package:nammakada/Plugins/Plugins.dart';



class SettingsM extends StatefulWidget {
  final userId;
  SettingsM(this.userId);
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsM> {
  _SettingsPageState();
  Color authclr = Colors.grey;
  authenticateUser() async {
    Map<String, dynamic> rslt =
         await Plugins.instance.excecute({"reqId": "BIOAUTH"});

    if (rslt['status'] && rslt['resp']['status']) {
      Map<String, dynamic> rslt = await Plugins.instance.excecute({
        'reqId': "SQL",
        'query': 'UPDATE TB_USERS SET BIO_AUTH = "true" WHERE USER_ID = "${widget.userId}";',
        'entity': "Customer"
      });
      if (rslt['status'] != false &&
          rslt['resp'].length > 0 &&
          rslt['resp'][0]['BIO_AUTH'] == "true") {}

      setState(() {
        authclr = Colors.green;
      });
    } else {
      Map<String, dynamic> rslt = await Plugins.instance.excecute({
        'reqId': "SQL",
        'query': 'UPDATE TB_USERS SET BIO_AUTH = "false" WHERE USER_ID = "${widget.userId}";',
        'entity': "Customer"
      });

      setState(() {
        authclr = Colors.grey;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchBioauth();
  }

  fetchBioauth() async {
    Map<String, dynamic> rslt = await Plugins.instance.excecute({
      'reqId': "SQL",
      'query': 'SELECT * FROM TB_USERS',
      'entity': "Customer"
    });
    if (rslt['status'] != false &&
        rslt['resp'].length > 0 &&
        rslt['resp'][0]['BIO_AUTH'] == "true") {
      setState(() {
        authclr = Colors.green;
      });
    }
  }

  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          authenticateUser();
        },
        child:Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.grey,
      )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              "Finger Print",
              style: TextStyle(
                  fontFamily: 'Opensans',
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
            width: MediaQuery.of(context).size.width * 0.2,
            alignment: Alignment.bottomRight,
            child: Container(
              child: Icon(
                Icons.fingerprint,
                color: authclr,
              ),
            ),
          )
        ],
      ),
    ),);
  }
}
