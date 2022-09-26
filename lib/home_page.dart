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
        title: const Text("TODAY"),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: h,
        width: w,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff0d50a9), Color(0xff99f5e0)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: ListView(
          children: const [TodayTile()],
        ),
      ),
    );
  }
}
