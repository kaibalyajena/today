import 'package:flutter/material.dart';
import 'package:today/utilities/today_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todayList = [
    ["do dsa", false],
    ["compathon", true]
  ];

  void changeCheckbox(bool? value, int index) {
    setState(() {});
  }

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
        backgroundColor: const Color(0xffe65c4f),
      ),
      body: Container(
          height: h,
          width: w,
          color: const Color(0xffe9eef4),
          child: ListView.builder(
            itemCount: todayList.length,
            itemBuilder: ((context, index) {
              return TodayTile(
                  task: todayList[index][0],
                  completed: todayList[index][1],
                  onChanged: (value) => changeCheckbox(value, index));
            }),
          )),
    );
  }
}
