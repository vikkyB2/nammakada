import 'package:flutter/material.dart';

import '../modules/Dashboard/optionsgrid.dart';
import '../modules/Dashboard/adverdiseswpr.dart';


class Dashboard extends StatelessWidget {
  final launchScreen;
  Dashboard(this.launchScreen);
  final options = [
    {"icon": Icons.person_outline, "option": "Add Cust", "disabled": false},
    {"icon": Icons.pie_chart, "option": "Add Item", "disabled": false},
    {"icon": Icons.card_travel, "option": "Add gst", "disabled": false},
    {"icon": Icons.compare_arrows, "option": "Rcnt Trans", "disabled": false},
    {"icon": Icons.mode_edit, "option": "Make Quot", "disabled": false},
    {"icon": Icons.note, "option": "Gen Invoice", "disabled": false},
    {"icon": Icons.card_membership, "option": "Add credit", "disabled": false},
    {"icon": Icons.exit_to_app, "option": "Add debit", "disabled": false},
    {"icon": Icons.report, "option": "Reports", "disabled": false},
    {"icon": Icons.settings, "option": "Settings", "disabled": false},
  ];

  formScreenObj(){
    Map screenObj = {'launchScreen': launchScreen, 'options': options,'contentCount':3,'custlst':""};
    return screenObj;
  }
  

  Widget build(BuildContext context) {
    return (Column(
      children: <Widget>[
        // Container(
        //   decoration: BoxDecoration(),
        //   child: AddSwiper(),
        // ),
        Expanded(child: DashboardGrid(formScreenObj())),
      ],
    ));
  }
}
