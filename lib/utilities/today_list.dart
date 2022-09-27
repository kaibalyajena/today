import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TodayTile extends StatelessWidget {
  final String task;
  final bool completed;
  final Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  TodayTile(
      {super.key,
      required this.task,
      required this.completed,
      required this.onChanged,
      required this.deleteTask});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Color(0xffe65c4f),
            )
          ],
        ),
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
                Checkbox(
                    value: completed,
                    onChanged: onChanged,
                    activeColor: const Color(0xffe9eef4),
                    checkColor: const Color(0xffe65c4f)),
                Text(
                  task,
                  style: TextStyle(
                      fontFamily: "NotoSansMono",
                      color: const Color(0xffe9eef4),
                      fontSize: 19,
                      decoration: completed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ],
            )),
      ),
    );
  }
}
