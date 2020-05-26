import '../Utils/constants.dart';
import './sqlite.dart';
import './PluginException.dart';
import './ToastMessage.dart';
import './biometric.dart';

class Plugins {
  Plugins._privateConstructor();
  static final Plugins instance = Plugins._privateConstructor();

  Future<Map<String, dynamic>> excecute(Map request) async {
    Map req = request;
    Map<String, dynamic> finalresp = {};
    List<Map<String, dynamic>> resp = [];
    Map<String, dynamic> respObj = {};
    String reqId = req['reqId'];
    try {
      if (reqId.toString() == SQL) {
        String query = req['query'];
        resp = await DatabaseHelper.instance.executeQuery(query);
        if (req.containsKey('entity')) {
          var entity = req['entity'];
          //resp = castMaptoEntity(resp, entity);
        }
        finalresp = formSuccessResponse(resp);
      } else if (reqId.toString() == TOAST) {
        print("toast");
        String msg = req['msg'];
        resp = [
          {"msg": "scss"}
        ];
        await ToastMessage.instance.showToast(msg);
        finalresp = formSuccessResponse(resp);
      } else if (reqId.toString() == BIOAUTH) {
        respObj = await Biometric.instance.authenticate();
        print(respObj.toString());
        finalresp = formSuccessResponse(respObj);
      }
    } on PluginException catch (e) {
      print("Plugin exception" + e.errorCode);
      finalresp = formErrorResponse(e.errorCode, e.errorMessage);
    } catch (e) {
      print("Unknown Exception" + e.toString());
      finalresp = formErrorResponse("E-001", "Unknown exception");
    }
    return finalresp;
  }

  Map<String, dynamic> formSuccessResponse(resp) {
    Map<String, dynamic> finalresp = {};
    finalresp['status'] = true;
    finalresp['resp'] = resp;
    return finalresp;
  }

  Map<String, dynamic> formErrorResponse(String errorcode, String errormsg) {
    Map<String, dynamic> finalresp = {};
    finalresp['status'] = false;
    finalresp['errorCode'] = errorcode;
    finalresp['errorMsg'] = errormsg;
    return finalresp;
  }
}
