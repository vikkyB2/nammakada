import '../Utils/constants.dart';
import './sqlite.dart';
import './PluginException.dart';
import './ToastMessage.dart';

class Plugins {
  Plugins._privateConstructor();
  static final Plugins instance = Plugins._privateConstructor();

  Future<Map<String, dynamic>> excecute(Map request) async {
    Map req = request;
    Map<String, dynamic> finalresp = {};
    List<Map<String, dynamic>> resp = [];
    String reqId = req['reqId'];
    try {
      if (reqId.toString() == SQL) {
        String query = req['query'];
        resp = await DatabaseHelper.instance.executeQuery(query);
      }else if (reqId.toString() == TOAST) {
        print("toast");
        String msg = req['msg'];
        resp = [{"msg":"scss"}];
        await ToastMessage.instance.showToast(msg); 
        print("resp" + resp.toString());
      }
      finalresp = formSuccessResponse(resp);
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
