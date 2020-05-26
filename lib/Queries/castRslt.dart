import '../entities/customerEntity.dart';

castMaptoEntity(List<Map<String, dynamic>> rslt, var entity) {
  List<Customer> finalResp = [];
  if (rslt.isNotEmpty && rslt.length > 0) {
    for (var i = 0; i < rslt.length; i++) {
      Customer entityObj = Customer();
      if(entity == 'Customer'){
          entityObj.setVals(rslt[i]);
      }
      finalResp.add(entityObj);
    }
  } else {
    return rslt;
  }
  return finalResp;
}
