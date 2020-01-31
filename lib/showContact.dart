import 'package:sipgateapi/contact.dart';
import 'package:flutter/material.dart';
import 'package:sipgateapi/sms.dart';

class ShowContact extends StatelessWidget {
  final Contact contact;

  ShowContact ({this.contact}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
            'assets/logo.jpg', 
            width: 250,
            height: 100,
            alignment: new Alignment(-2, -1.0),),
      ),
      body: Padding (
        padding: new EdgeInsets.all(20),
        child: new Table(
          defaultColumnWidth: IntrinsicColumnWidth(),
          children: <TableRow>[
            buildTableRow("Name", contact.name),
            buildTableRow("Email", contact.emails.join("\n")),
            buildMultiTableRow("Mobile:", contact.mobile, context),
            /*buildTableRow("Mobile", contact.mobile.join("\n"),
              onTap: () => onTapped(contacts[index]));,*/
            buildTableRow("Landline", contact.landline.join("\n")),
            buildTableRow("Fax", contact.fax.join("\n")),
            buildTableRow("Directdial", contact.directdial.join("\n")),
          ],
        )),
    );
  }

  void onTapped(String mobile, var context)
  {
    print(mobile);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Sms(mobile: mobile)),
    );
  }

  TableRow buildMultiTableRow (String label, var content, var context) {
      var cellPadding = EdgeInsets.all(15);
      String currMobile = content.join("\n");

      return TableRow (
        children: [
          Container(
            child: Text (label),
            padding: cellPadding,
          ),
          InkWell(
            child: Text (content.join("\n")),
            onTap: () => onTapped(currMobile, context),
          ),
        ],
      );
  }

  TableRow buildTableRow (String label, String content) {
    var cellPadding = EdgeInsets.all(15);

    return TableRow (
      children: [
        Container(
          child: Text (label),
          padding: cellPadding,
        ),
        Container(
          child: Text (content),
          padding: cellPadding,
        ),

      ]);
  }
}

