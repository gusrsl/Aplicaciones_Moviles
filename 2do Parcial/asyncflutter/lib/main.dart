// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'services/mockapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asyncronia en Flutter: By Gus',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xfffce4ec),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromARGB(255, 153, 93, 125),
        ),
      ),
      home: const asyncflutter(title: 'Asyncronia en Flutter: By Gus'),
    );
  }
}

class asyncflutter extends StatefulWidget {
  const asyncflutter({super.key, required this.title});

  final String title;

  @override
  State<asyncflutter> createState() => _asyncflutterState();
}

// ignore: camel_case_types
class _asyncflutterState extends State<asyncflutter> {
  //DECLARACIONES DE VARIABLES

  //VARIABLES PARA ICONE1
  int a = 0;
  int a_tiempo = 0;
  double a_bar = 0;
  int astring = 0;

  //VARIABLES PARA ICONE2
  int b = 0;
  int b_tiempo = 0;
  double b_bar = 0;
  int bstring = 0;

  //VARIABLES PARA ICONE3
  int d = 0;
  int d_tiempo = 0;
  double d_bar = 0;
  int dstring = 0;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w600,
            fontSize: 20),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        margin: const EdgeInsets.fromLTRB(0, 50, 0, 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //CODIGO DEL 1ER ICONE
            Ink(
              decoration: const ShapeDecoration(
                color: Color.fromARGB(255, 138, 17, 162),
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.accessible_forward_sharp,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                iconSize: 80.0,
                //aplicacion del servicio mockapi y sus procesos asyncronos
                onPressed: () async {
                  setState(() {
                    a_bar = 360;
                    a_tiempo = 1;
                  });
                  a = await MockApi().getFerrariInteger();
                  setState(() {
                    astring = a;
                    a_bar = 0;
                    a_tiempo = 0;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: AnimatedContainer(
                width: a_bar,
                height: 12,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 247, 0, 0),
                  borderRadius: _borderRadius,
                ),
                duration: Duration(seconds: a_tiempo),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Text(
                'El numero seleccionado es: $a',
                style: const TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            //CODIGO DEL 2DO ICONE
            Ink(
              decoration: ShapeDecoration(
                color: Colors.orange.shade300,
                shape: const CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.art_track_sharp,
                  color: Colors.black,
                ),
                iconSize: 80.0,
                onPressed: () async {
                  setState(() {
                    b_bar = 360;
                    b_tiempo = 3;
                  });
                  b = await MockApi().getHyundaiInteger();
                  setState(() {
                    bstring = b;
                    b_tiempo = 0;
                    b_bar = 0;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: AnimatedContainer(
                  width: b_bar,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade300,
                    borderRadius: _borderRadius,
                  ),
                  duration: Duration(seconds: b_tiempo)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Text(
                'El numero seleccionado es: $b',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            //CODIGO DEL 3ER ICONE
            Ink(
              decoration: ShapeDecoration(
                color: Colors.red.shade300,
                shape: const CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.assured_workload_rounded,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                iconSize: 80.0,
                onPressed: () async {
                  setState(() {
                    d_bar = 360;
                    d_tiempo = 10;
                  });
                  d = await MockApi().getFisherPriceInteger();
                  setState(() {
                    dstring = d;
                    d_tiempo = 0;
                    d_bar = 0;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: AnimatedContainer(
                  width: d_bar,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.red.shade300,
                    borderRadius: _borderRadius,
                  ),
                  duration: Duration(seconds: d_tiempo)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                'El numero seleccionado es: $d',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
