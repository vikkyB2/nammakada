import '../Utils/constants.dart';
import './sqlite.dart';
import './PluginException.dart';

class Plugins {
  Plugins._privateConstructor();
  static final Plugins instance = Plugins._privateConstructor();

  Future<Map<String, dynamic>> excecute(Map request) async {
    Map req = request;
    Map<String, dynamic> finalresp = {};
    String reqId = req['reqId'];
    try {
      print("change" + reqId.toString());
      if (reqId.toString() == SQL) {
        String query = req['query'];
        List<Map<String, dynamic>> resp =
            await DatabaseHelper.instance.executeQuery(query);
            formSuccessResponse(resp);
        print("resp" + resp.toString());
      }
    } on PluginException catch (e) {
      print("Plugin exception" + e.errorCode);
      finalresp = formErrorResponse(e.errorCode,e.errorMessage);
    } catch (e) {
      print("Unknown Exception");
      finalresp = formErrorResponse("E-001","Unknown exception");
    } 
    return finalresp;
  }

  Map<String, dynamic> formSuccessResponse(resp) {
    Map<String, dynamic> finalresp = {};
    finalresp['status'] = true;
    finalresp['resp'] = resp;
    return finalresp;
  }
  Map<String, dynamic> formErrorResponse(String errorcode,String errormsg) {
    Map<String, dynamic> finalresp = {};
    finalresp['status'] = false;
    finalresp['errorCode'] = errorcode;
    finalresp['errorMsg'] = errormsg;
    return finalresp;
  }
}
