import 'package:flutter/material.dart';

class DashboardGrid extends StatelessWidget {
  final screenObj;
  List<Map<String,dynamic>> options;
  int count;
  Function launchScreen;
  
  DashboardGrid(this.screenObj){
    options = screenObj['options'];
    count = screenObj['contentCount'];
    launchScreen = screenObj['launchScreen'];
  }

  listclicked(index) {
    //Plugins.instance.excecute({"reqId":"TOAST","msg":options[index]['option']});
    String scrrScreen = options[index]['option'];
    if (!options[index]['disabled']) {
      launchScreen(false,scrrScreen);
    }
  }

  getCardClr(context, index) {
    if (!options[index]['disabled']) {
      return Theme.of(context).primaryColor;
    }else{
      return Theme.of(context).primaryColorLight;
    }
  }

  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: count,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(options.length, (index) {
          return Container(
            padding: EdgeInsets.all(2),
            height: 10,
            width: 10,
            child: GestureDetector(
              onTap: () {
                listclicked(index);
              },
              child: Card(
                color: getCardClr(context, index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconTheme(
                      data: IconThemeData(color: Theme.of(context).accentColor),
                      child: Icon(
                        options[index]["icon"],
                      ),
                    ),
                    Text(
                      options[index]["option"],
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
