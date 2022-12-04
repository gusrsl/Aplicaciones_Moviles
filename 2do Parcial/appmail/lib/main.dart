// import 'package:flutter/material.dart';
// import 'pages/ListScreen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ListScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'pages/ListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INSANE MAIL',
      theme: ThemeData(
          primarySwatch:
              Colors.blue, // same as Colors.blue[500] or Colors.blue.shade500,
          visualDensity: VisualDensity.comfortable),
      home: const ListScreen(
        title: 'Insane Mail',
      ),
    );
  }
}
