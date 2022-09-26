import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 158, 204, 240),
      content: Container(
        height: h / 3,
        child: Column(children: const [
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Add new task"),
          )
        ]),
      ),
    );
  }
}
