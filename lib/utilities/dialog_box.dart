import 'package:flutter/material.dart';
import 'package:today/utilities/my_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 158, 204, 240),
      content: Container(
        height: h / 5,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const TextField(
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff326789))),
                border: OutlineInputBorder(),
                hintText: "Add new task"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyButton(text: "save", onPressed: () {}),
              MyButton(text: "cancel", onPressed: () {})
            ],
          )
        ]),
      ),
    );
  }
}
