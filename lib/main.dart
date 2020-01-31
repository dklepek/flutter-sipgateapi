import 'dart:convert';
import 'package:sipgateapi/api.dart';
import 'package:sipgateapi/contact.dart';
import 'package:flutter/material.dart';
import 'package:sipgateapi/showContact.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sipgate App',
      theme: ThemeData(
        primarySwatch: Colors.primaryBlack,
      ),
      home: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  var contacts = new List<Contact>();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        List<dynamic> data = map["items"];
        print(data);
        //users.add((Contact.fromJson(data[0])));
        data.forEach((element) => contacts.add((Contact.fromJson(element))));
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/logo.jpg',
            width: 250,
            height: 100,
            alignment: new Alignment(-1.7, -1.0),
        )),
        body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(contacts[index].name),
              onTap: () => onTapped(contacts[index]));
          },
        ));
    }

    void onTapped(Contact contact)
    {
      print(contact.emails[0]);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ShowContact(contact: contact)),
      );
    }
}