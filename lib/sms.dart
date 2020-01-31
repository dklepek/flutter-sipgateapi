import 'package:flutter/material.dart';
import 'package:sipgateapi/api.dart';

class Sms extends StatelessWidget {
  final String mobile;
  final controller = TextEditingController();

  Sms ({this.mobile}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
            'assets/logo.jpg',
            width: 250,
            height: 100,
            alignment: new Alignment(-1.7, -1.0),
            ),
      ),
      body: Padding (
        padding: new EdgeInsets.all(20),
        child: Column(
          //Zentrieren unseres "Column" Elements
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //Anzeigen der Handynummer
            Text (mobile),
            //Eingabefeld für den Inhalt der SMS
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Nachricht eingeben...',
              ),
            ),
            //Button zum Abschicken der SMS
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: (
              ) {
                //Aufrufen der sendSMS Funktion in unserer api.dart
                API.sendSMS(mobile, controller.text).then((response) {
                  print("REPONSE: " + response.body);
                });
              },
              child: Text(
              "Senden",
                style: TextStyle(fontSize: 20.0),
              )
            )
          ])
      )
    );
  }
}

