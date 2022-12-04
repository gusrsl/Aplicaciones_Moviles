import 'package:flutter/material.dart';
import '../models/backend.dart';
import '../models/email.dart';
import '../widgets/EmailWidget.dart';
import '../pages/DetailScreen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ListScreenState createState() => _ListScreenState();
}

//METODOS DE SIMULACION DEL BACKEND

class _ListScreenState extends State<ListScreen> {
  // State.
  var emails = Backend().getEmails();

  void showDetail(Email email) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailScreen(email: email);
    }));

    Backend().markEmailAsRead(email.id);
    setState(() {
      emails = Backend().getEmails();
    });
  }

  void deleteEmail(int id) {
    Backend().deleteEmail(id);
    setState(() {
      emails = Backend().getEmails();
    });
  }

  void markEmailAsRead(int id) {
    Backend().markEmailAsRead(id);
    setState(() {
      emails = Backend().getEmails();
    });
  }

  //WIDGET

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: emails.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Color.fromARGB(255, 0, 0, 0),
          indent: 10.0,
          endIndent: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) => EmailWidget(
          email: emails[index],
          onTap: showDetail,
          onLongPress: markEmailAsRead,
          onSwipe: deleteEmail,
        ),
      ),
    );
  }
}
