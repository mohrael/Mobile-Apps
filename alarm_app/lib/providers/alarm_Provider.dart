import 'package:flutter/material.dart';
import 'package:alarm_app/models/alarmModel.dart';

class AlarmProvider with ChangeNotifier{

  List<AlarmModel>_alarms=[];

  List<AlarmModel>get alarms => _alarms;

  void addAlarm(AlarmModel alarm){
    _alarms.add(alarm);
    notifyListeners();
  }

  void toggleAlarm(int index){
    _alarms[index].isActive=!_alarms[index].isActive;
    notifyListeners();
  }
  

}