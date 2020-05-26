import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:nammakada/Plugins/Plugins.dart';
import 'package:nammakada/entities/customerEntity.dart';
import 'package:nammakada/Queries/castRslt.dart';
import 'package:nammakada/modules/Dashboard/recentlist.dart';

class AddSwiper extends StatelessWidget {
  fetchCustomers() async {
    List<Customer> queryrslt = [];
    Map<String, dynamic> rslt = await Plugins.instance.excecute(
        {'reqId': "SQL", 'query': 'SELECT * FROM TB_CUST', 'entity': Customer});
    if (rslt['status'] != false && rslt['resp'].length > 0) {
      List<Customer> queryrslt = castMaptoEntity(rslt['resp'], 'Customer');
    }
    return queryrslt;
  }

  Widget build(BuildContext context) {
    return Swiper(
        itemCount: 1,
        viewportFraction: 0.8,
        layout: SwiperLayout.STACK,
        itemHeight: 250,
        itemWidth: 400,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: Expanded(
            child: Text(
              "check"
            ),
          ));
        });
  }
}
