import 'package:hive_flutter/hive_flutter.dart';

class TodayDatabase {
  List todayList = [];
  final _myBox = Hive.box('mybox');

  void createInitialData() {
    todayList = [
      ["do dsa", false],
      ["compathon", false]
    ];
  }

  void loadData() {
    todayList = _myBox.get("TODAYLIST");
  }

  void updateData() {
    _myBox.put("TODAYLIST", todayList);
  }
}
