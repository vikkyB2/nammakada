import 'package:flutter/material.dart';
import 'package:nammakada/Plugins/Plugins.dart';
import './entities/customerEntity.dart';
import './modules/customermodules/customers_list.dart';
import './Queries/processQueries.dart';
import './modules/customermodules/add_customer.dart';
import './entities/customerEntity.dart';
import './Utils/constants.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Customer> _customers = [];

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

  updateCust(String name, String phone) {
    Customer nwCust = Customer(custName: name, custPhone: phone);
    setState(() {
      _customers.add(nwCust);
    });
  }
  @override
  void initState() async{
    super.initState();
    ProcessQueries().checktablePresent();
    Map<String,dynamic> rslt  =  await Plugins.instance.excecute({'reqId':SQL,'query':'SELECT * FROM TB_CUST'});
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(height: 250, child: CuatomersList(_customers)),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.add),
          backgroundColor: Colors.blue,
          onPressed: () {
            _startAddNewTransaction(context);
          }),
    );
  }
}
