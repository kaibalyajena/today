import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:today/data/database.dart';
import 'package:today/utilities/dialog_box.dart';
import 'package:today/utilities/today_list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');
  TodayDatabase db = TodayDatabase();

  @override
  void initState() {
    if (_myBox.get("TODAYLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  // List todayList = [
  //   ["do dsa", false],
  //   ["compathon", true]
  // ];
  final _controller = TextEditingController();
  void changeCheckbox(bool? value, int index) {
    setState(() {
      db.todayList[index][1] = !db.todayList[index][1];
    });
    db.updateData();
  }

  void onSave() {
    setState(() {
      db.todayList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.pop(context);
    db.updateData();
  }

  void onCancel() {
    Navigator.pop(context);
    db.updateData();
  }

  void createTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: onSave,
            onCancel: onCancel,
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.todayList.remove(db.todayList[index]);
    });
    db.updateData();
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
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        backgroundColor: const Color(0xffe65c4f),
        child: const Icon(Icons.add),
      ),
      body: Container(
          height: h,
          width: w,
          color: const Color(0xffe9eef4),
          child: ListView.builder(
            itemCount: db.todayList.length,
            itemBuilder: ((context, index) {
              return TodayTile(
                task: db.todayList[index][0],
                completed: db.todayList[index][1],
                onChanged: (value) => changeCheckbox(value, index),
                deleteTask: (ctx) => deleteTask(index),
              );
            }),
          )),
    );
  }
}
