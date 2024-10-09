import 'package:alarm_app/models/alarmModel.dart';
import 'package:alarm_app/providers/alarm_Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SetAlarmScreen extends StatefulWidget{
  const SetAlarmScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SetAlarmScreenState();

}

class _SetAlarmScreenState extends State<SetAlarmScreen>{
  TimeOfDay? _selectedTime;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text('Set Alarm'),
      backgroundColor: Colors.blueAccent,
  
    ),
    body:Center(
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        
        child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30,),
    
          ElevatedButton(
            onPressed:()async{
              _selectedTime=await showTimePicker(
                context:context , 
                initialTime:TimeOfDay.now(),
                );
                setState(() {});
            } ,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              padding:const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
            child:const Text(
              'Choose Alarm Time',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ), 
          ),
          const SizedBox(height: 20,),
            if(_selectedTime != null)

              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,horizontal: 24,
                ),
                margin: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  borderRadius:BorderRadius.circular(15),
                  border: Border.all(color: Colors.blueAccent,width: 2),

                ),
                child: Text(
                  'Selected Time: ${_selectedTime!.format(context)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    ) ,
                ),
              ),

            const SizedBox(height: 30,),
            ElevatedButton(
              onPressed:(){
                if(_selectedTime != null){

                  final newAlarm = AlarmModel(time: _selectedTime!.format(context));
                  context.read<AlarmProvider>().addAlarm(newAlarm);
                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding:const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
            child:const Text(
              'Set Alarm',
              style: TextStyle(fontSize: 20,color: Colors.white),
          
            )),  
            
      
        ],),
    )
    )
    );

  }

  
}