import 'package:flutter/material.dart';
import './entities/customerEntity.dart';
import './modules/customermodules/customers_list.dart';
import './Queries/processQueries.dart';
import './modules/customermodules/add_customer.dart';
import './entities/customerEntity.dart';

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
  void initState() {
    super.initState();
    ProcessQueries().checktablePresent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.blue[300],
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
