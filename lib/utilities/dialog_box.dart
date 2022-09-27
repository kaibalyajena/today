import 'package:flutter/material.dart';
import 'package:today/utilities/my_button.dart';

class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 158, 204, 240),
      content: Container(
        height: h / 5,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff326789))),
                border: OutlineInputBorder(),
                hintText: "Add new task"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyButton(text: "save", onPressed: onSave),
              MyButton(text: "cancel", onPressed: onCancel)
            ],
          )
        ]),
      ),
    );
  }
}
