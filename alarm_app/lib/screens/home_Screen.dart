import 'package:alarm_app/providers/alarm_Provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'set_alarm_Screen.dart';


class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override

  State<StatefulWidget> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {

    final alrams = context.watch<AlarmProvider>().alarms;
    String curTime = DateFormat('hh:mm a').format(DateTime.now());
    String curDate = DateFormat('EEE,MMM d,yyyy').format(DateTime.now());

    return Scaffold(
      appBar:AppBar(
        title: const Text('Alarm Clock',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        

      ) ,

      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(height: 30,),
            Padding(
              padding:const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(curTime,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    curDate,
                    style: const TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 2,),
            Expanded(
              child:alrams.isNotEmpty
              ?ListView.builder(
                itemCount: alrams.length,
                itemBuilder: (context,index){
                  final alarm = alrams[index];
                  return  Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16.0,vertical: 8.0,
                    ),
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                    title: 
                    Text(alarm.time,
                    style: 
                    const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                          ),
                    ),

                    trailing: Switch(
                      value:alarm.isActive,
                      activeColor: Colors.green,
                      onChanged: (value){
                        context.read<AlarmProvider>().toggleAlarm(index);
                      },
                    )
                    ),
                  );
                }
                )
                : const Center(
                  child: Text(
                    'No Alarms set.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                )
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const SetAlarmScreen()),
          );
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.alarm_add , size: 30,),
        ),
        backgroundColor: Colors.white,
    );
  }

}