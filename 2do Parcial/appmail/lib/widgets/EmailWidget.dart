import 'package:flutter/material.dart';
import '../Styles.dart';
import '../models/email.dart';

class EmailWidget extends StatelessWidget {
  final Email email;
  final Function onTap;
  final Function onSwipe;
  final Function onLongPress;

  const EmailWidget(
      {Key? key,
      required this.email,
      required this.onTap,
      required this.onSwipe,
      required this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        onSwipe(email.id);
      },
      onLongPress: () {
        onLongPress(email.id);
      },
      onTap: () {
        onTap(email);
      },
      child: Container(
        padding: const EdgeInsets.all(6.0),
        height: 50.0,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 20.0,
                decoration: BoxDecoration(
                    color: email.read ? Colors.transparent : Colors.blueGrey,
                    shape: BoxShape.circle),
              ),
            ),
            Expanded(
              flex: 9,
              child: Column(
                children: [
                  Text(email.from, style: fromTS),
                  Text(email.subject, style: asuntoTS),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
