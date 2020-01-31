import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.sipgate.com";

//Hier setzt du deine sipgate Zugangsdaten ein
const username = "YOUR_SIPGATE_EMAIL";
const password = "YOUR_SIPGATE_PASSWORD";

/*Dadurch kann hier der Token für die Authentifizierung zur Nutzung
der API erstellt werden*/
final token = base64Encode(utf8.encode("$username:$password"));

class API {
  static Future getUsers() {
    var url = baseUrl + "/v2/contacts/internal";
    return http.get(url, headers:{"Authorization":" Basic " + token});
  }
  static Future sendSMS(String mobile, String message) {
    //Setzen der API URL
    var url = baseUrl + "/v2/sessions/sms";

    //smsId stellt die SMS Extension dar
    String smsId = "YOUR_SMS_EXTENSION";

    //Hier wird der body in das JSON-Format kodiert
    var jsonBody = json.encode({"smsId": smsId, "recipient": mobile, "message": message});

    //HTTP Request zum Senden der SMS
    return http.post(url, headers:{"Authorization":" Basic " + token, "Content-Type":" application/json", "Accept":" application/json"},
      body: jsonBody
    );
  }
}



