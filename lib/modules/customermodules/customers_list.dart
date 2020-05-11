import 'package:flutter/material.dart';
import '../../entities/customerEntity.dart';

class CuatomersList extends StatelessWidget {
  final List<Customer> custList;
  CuatomersList(this.custList);

  Widget getCustomersList() {
    if (custList.length > 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Customer List",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (ctx, i) {
              return Card(
                margin: EdgeInsets.only(top: 1, bottom: 1, left: 10, right: 10),
                child: Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        custList[i].custName.substring(0, 1).toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(50.0)),
                          border: Border.all(color: Colors.blue)),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              custList[i].custName,
                              style: TextStyle(
                                  color: Colors.blue[300],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text(custList[i].custPhone)
                          ],
                        )),
                  ],
                ),
              );
            },
            itemCount: custList.length,
          )
        ],
      );
    } else {
      return Container(
          width: double.infinity,
          padding: EdgeInsets.only(bottom: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.block,
                size: 50,
                color: Colors.grey,
              ),
              Text(
                "No data found",
                style: TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return getCustomersList();
  }
}
