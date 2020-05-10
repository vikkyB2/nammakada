import '../Plugins/Plugins.dart';
import '../Utils/constants.dart';
import './create.dart';

class ProcessQueries {
  checktablePresent() async {
    Map<String, dynamic> rslt = await Plugins.instance
        .excecute({'reqId': SQL, 'query': 'SELECT * FROM TB_TBL_VERSION'});
    if (rslt['status'] == false && rslt['errorCode'] == 'DB-001') {
      print("createTables");
      String createQuery = '';
      create.forEach((k, val) async {
        createQuery = formCreateQuery(val);
        if (createQuery != '') {
          await Plugins.instance.excecute({'reqId': SQL, 'query': createQuery});
          await Plugins.instance.excecute({'reqId': SQL, 'query': 'INSERT INTO TB_TBL_VERSION(TABLE_NAME,TABLE_VERSION)values("${val['name']}","${val['version'].toString()}")'});
        }
      });
      }
  }

  String formCreateQuery(val) {
    String createQuery = '';
    if (val['columns'].length > 0 && val['types'].length > 0) {
      createQuery = 'CREATE TABLE ';
      createQuery = createQuery + val['name'] + '(';
      for (var i = 0; i < val['columns'].length; i++) {
        createQuery = createQuery + val['columns'][i] + ' ';
        createQuery = createQuery + val['types'][i] + ',';
      }
      if (val['pk'].length > 0) {
        createQuery = createQuery + 'PRIMARY KEY(';
        for (var j = 0; j < val['pk'].length; j++) {
          createQuery = createQuery + val['pk'][j] + ',';
        }
        createQuery = createQuery.substring(0, createQuery.length - 1);
        createQuery = createQuery + ')';
      } else {
        createQuery = createQuery.substring(0, createQuery.length - 1);
      }
      createQuery = createQuery + ')';
    }
    return createQuery;
  }
}
