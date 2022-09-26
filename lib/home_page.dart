import 'package:flutter/material.dart';
import 'package:today/utilities/today_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "THE DAY",
          style: TextStyle(fontFamily: 'NotoSansMono', fontSize: 25),
        ),
        backgroundColor: Color(0xffe65c4f),
      ),
      body: Container(
        height: h,
        width: w,
        color: const Color(0xffe9eef4),
        child: ListView(
          children: [
            TodayTile(task: "to dsa", completed: false),
            TodayTile(task: 'study for midsem', completed: true)
          ],
        ),
      ),
    );
  }
}
