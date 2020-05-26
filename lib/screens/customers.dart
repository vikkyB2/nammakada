import 'package:flutter/material.dart';
import 'package:nammakada/Plugins/Plugins.dart';
import '../entities/customerEntity.dart';
import '../modules/customermodules/customers_list.dart';
import '../modules/customermodules/add_customer.dart';
import '../Queries/castRslt.dart';
import '../Utils/constants.dart';
import '../Utils/contentloader.dart';

class Customers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomersPage();
  }
}

class CustomersPage extends StatefulWidget {
  @override
  _CustomersPageState createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  List<Customer> _customers = [];
  bool isLoadervis = true;
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: AddCustomer(updateCust),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  updateCust(String name, String phone) async {
    await Plugins.instance.excecute({
      'reqId': SQL,
      'query':
          'INSERT INTO TB_CUST("custName","custPhone")values("$name","$phone")'
    });
    Map<String, dynamic> rslt = await Plugins.instance.excecute(
        {'reqId': SQL, 'query': 'SELECT * FROM TB_CUST', 'entity': 'Customer'});
    if (rslt['status'] && rslt['resp'].length > 0) {
      List<Customer> custResp = castMaptoEntity(rslt['resp'], 'Customer');
      setState(() {
        _customers = custResp;
        isLoadervis = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCustomers();
  }

  fetchCustomers() async {
    Map<String, dynamic> rslt = await Plugins.instance.excecute(
        {'reqId': SQL, 'query': 'SELECT * FROM TB_CUST', 'entity': Customer});
    if (rslt['status'] != false && rslt['resp'].length > 0) {
      List<Customer> queryrslt = castMaptoEntity(rslt['resp'], 'Customer');
      setState(() {
        _customers = queryrslt;
        isLoadervis = false;
      });
    }
  }

  showContent() {
    return isLoadervis
        ? ContentLoader().getLoader(true)
        : CustomersList(_customers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[showContent()]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.add),
          onPressed: () {
            _startAddNewTransaction(context);
          }),
    );
  }
}
