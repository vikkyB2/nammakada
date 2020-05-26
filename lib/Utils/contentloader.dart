import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class ContentLoader {
  getLoader(isvisble) {
    if (isvisble) {
      return SizedBox(
        width: 200.0,
        height: 100.0,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[400],
          highlightColor: Colors.grey[100],
          child:  Container(
              height: 800,
              child: ListView.builder(
                itemBuilder: (ctx, i) {
                  return GestureDetector(
                    onTap: (){
                    },
                      child: Card(
                            margin:EdgeInsets.only(top: 1, bottom: 1, left: 10, right: 10),
                            child: Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.indeterminate_check_box,
                          ),
                          padding: EdgeInsets.all(10),
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(50.0)),
                              border: Border.all(
                                  color: Colors.grey)),
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text("")
                              ],
                            )),
                      ],
                    ),
                  ));
                },
                itemCount: 10,
              )),
        ),
      );
    } else {
      return null;
    }
  }
}
