import 'package:flutter/material.dart';
import '../Styles.dart';
import '../models/email.dart';

class DetailScreen extends StatelessWidget {
  final Email email;

  const DetailScreen({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(email.subject, style: titleTS),
        ),
        body: Container(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('From: ${email.from}', style: fromTS),
              const SizedBox(height: 10.0),
              const Divider(color: primaryColor),
              const SizedBox(height: 10.0),
              Text(email.subject, style: asuntoTS),
              const SizedBox(height: 5.0),
              const SizedBox(height: 10.0),
              const Divider(color: primaryColor),
              const SizedBox(height: 10.0),
              Text(email.body, style: cuerpoTS),
            ],
          ),
        ));
  }
}
