import '../Plugins/sqlite.dart';

class CustomerData {
  final dbHelper = DatabaseHelper.instance;

  queryCustomersfromDB(tableName,{id = "%"}) async{
    print("id" + id);
    final allRows = await dbHelper.queryAllRows(tableName);
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  addCustomerstoDB() {}
  deleteCustomerinDB() {}

  excecuteQuery(query) async{
    await dbHelper.executeQuery(query);
  }
}
