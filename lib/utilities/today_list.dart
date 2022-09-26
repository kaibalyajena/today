import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TodayTile extends StatelessWidget {
  final String task;
  bool completed;
  Function(bool?)? onChanged() {
    if (completed == true) {
      completed = false;
    } else {
      completed = true;
    }
  }

  TodayTile({super.key, required this.task, required this.completed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                  colors: [Color(0xff76a6c8), Color(0xff326789)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Row(
            children: [
              Checkbox(value: completed, onChanged: onChanged()),
              Text(
                task,
                style: const TextStyle(
                  fontFamily: "NotoSansMono",
                  color: Color(0xffe9eef4),
                  fontSize: 17,
                ),
              ),
            ],
          )),
    );
  }
}
