import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/TaskModel.dart';
import 'package:flutter/material.dart';


class To_dO_list extends StatefulWidget{
  const To_dO_list({super.key});

  @override
  State<To_dO_list>createState(){
    return _To_dO_list();
  }
}

class _To_dO_list extends State<To_dO_list>{
  
  List<TaskModel> tasksList=[];
  SharedPreferences? sharedPreferences;

  bool showCompletedTasks = false; 

  
  final TextEditingController taskTextEditingController = TextEditingController();
  
  @override
  void initState(){
    initPrefs();
    super.initState();
  }

  void initPrefs() async{
    sharedPreferences = await SharedPreferences.getInstance();
    readTasks();
  }


  void saveOnLocalStorage(){
    final taskData = tasksList.map((task) => task.toJson()).toList();
    sharedPreferences?.setStringList('tasks', taskData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:const Color.fromARGB(255, 115, 83, 118) ,
      appBar: AppBar(
        title: const Text('My To-Do List'
        ,style: TextStyle( fontWeight: FontWeight.bold,
            fontSize: 25),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                setState(() {
                  showCompletedTasks = !showCompletedTasks;
                });
              },
            )
          ],
        // centerTitle: true,
        // toolbarHeight: 75,
      //   leading: IconButton(
      //     icon:const Icon(Icons.menu), 
      //     onPressed: () { },
      // ),
      // elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader( 
            decoration:
            BoxDecoration(color: Colors.deepPurple), 
            child: Text(
              'Task Lists',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24
              ),
            ) ,
            ),
            ListTile(
              leading: const Icon(Icons.list)
              ,title: const Text('All Tasks'),
              onTap: (){
                setState(() {
                  showCompletedTasks=false;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.check_box),
              title: const Text('Completed Tasks'),
              onTap: () {
                setState(() {
                  showCompletedTasks=true;
                });
              Navigator.pop(context);
            },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: (){},
            )

          ],

        ),),
      body: Container(
        margin: const EdgeInsets.all(10),
        // decoration: const BoxDecoration(
        //   color: Color.fromARGB(255, 217, 199, 247),
        // ),
        
        child:tasksList.isNotEmpty?
        // Column(children: [
        //   Expanded(
        //     flex: 90,
        //     child: 
          // Padding(
            // padding:const EdgeInsets.only(top: 20.0),
            ListView.builder(
              itemCount: tasksList.length,
              itemBuilder: (context,index){
                final TaskModel task=tasksList[index];
                if (showCompletedTasks && !task.isCompelted) return Container();

                return Card( 
                  elevation: 5,
                  shape:
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                    ),
                  child: ListTile(
                        leading: Checkbox(
                          value: task.isCompelted,
                          onChanged: (isChecked) {
                            final updatedTask = TaskModel(
                              id: task.id,
                              title: task.title,
                              isCompelted: isChecked!,
                            );
                            updateTask(taskId: task.id, updatedTask: updatedTask);
                          },
                        ),
                        title: Text(
                          task.title,
                          style: TextStyle(
                            fontSize: 18,
                            decoration: task.isCompelted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            deleteTask(taskId: task.id);
                          },
                        ),
                        onTap: () {
                          showUpdateDialog(task: task);
                        },
                      ),
                    );
                  },
                )
                  // child: InkWell(
                  // onTap: () {
                  //   showUpdateDialog(task: task); // Show dialog for updating task
                  // },
        //           child:Row(children: [
        //             Expanded(
        //             flex: 5,
        //             child: Checkbox(
        //               value: task.isCompelted,
        //               onChanged: (isChecked){
        //               final updatedTask = TaskModel(
        //             id: task.id,
        //             title: task.title,
        //             isCompelted: isChecked!,
        //           );
        //           updateTask(taskId: task.id, updatedTask: updatedTask);
        //               },)

        //             ),
        //             Expanded(
        //               flex: 40,
        //               child:Text(
        //             task.title,
        //             style:  TextStyle(
        //               color: const Color.fromARGB(255, 60, 22, 67),
        //               decoration: task.isCompelted?
        //               TextDecoration.lineThrough:
        //               TextDecoration.none,
        //               fontSize: 20,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //             ),
        //           Expanded(
        //             flex:20,
        //             child: CircleAvatar(
        //               radius: 30,
        //               backgroundColor:Colors.white,
        //               child: TextButton(
        //               onPressed: () {
        //               deleteTask(taskId: task.id);
        //               },
        //               child:const Icon(Icons.delete
        //             ,color: Colors.black,
        //             size: 30.0,),
        //             ),
        //             ),
                    
        //           )
        // ]),
        //           // leading:Transform.scale(
        //           //   scale: 2.0,
        //           //   child: Checkbox(
        //           //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        //           //     value: task.isCompelted,
        //           //     onChanged: (isChecked){
        //           //       final TaskModel updatedTask=task;
        //           //       updatedTask.isCompelted=isChecked!;
        //           //       updateTask(
        //           //         taskId:updatedTask.id,
        //           //         updatedTask:updatedTask,
        //           //       );
        //           //   } ,),
        //           // ),
        //         )
        //         );
        //       }
            // ),
          // )

        // ],
        // )
        :const Center(
          // child: Padding(padding: 
          // EdgeInsets.symmetric(horizontal: 30.0),
          child: Text('No tasks registered, tap the button with the + symbol',
          textAlign: TextAlign.center,),
          
          ),
        
        // )
      ),

      floatingActionButton: FloatingActionButton
      (
        backgroundColor: Colors.teal,
        onPressed:showDialogButton,
        child:const Icon(Icons.add,size: 30,color: Colors.white,),
        
        ),
      
    );
  }

void showUpdateDialog({required TaskModel task}) {
  final TextEditingController updateTextController = 
    TextEditingController(text: task.title);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Update Task'),
        content: TextField(
          controller: updateTextController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            labelText: 'Update Task...',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (updateTextController.text.isNotEmpty) {
                final updatedTask = TaskModel(
                  id: task.id,
                  title: updateTextController.text,
                  isCompelted: task.isCompelted,
                );
                updateTask(taskId: task.id, updatedTask: updatedTask);
                Navigator.of(context).pop();
              }
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}


  void showDialogButton(){
    showDialog(
      context:context, 
      builder: (context){
        return AlertDialog(

          title: const Text('New Task'),
          content: TextField(
          controller: taskTextEditingController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            labelText: 'Create Task...',
          ),
        ),
          // content: TextField(
          //   controller: taskTextEditingController,

          //   decoration:InputDecoration(
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(15),
          //       ),
          //       fillColor: const Color.fromARGB(255, 177, 62, 183),
          //       filled: true,
          //       labelStyle: const TextStyle(
          //         height: 15,
          //         color: Color.fromARGB(255, 233, 167, 239),
          //         fontWeight: FontWeight.bold,
                
          //     // labelText:'Describe Your Task', 
          //   ),    
          //   labelText: 'Create Task....',

          //   )
          //   // maxLength: 2,
          // ),
        
          actions: [
            TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            
            child:const Text('Cancel')),
            TextButton(
            onPressed: (){
              if(taskTextEditingController.text.isNotEmpty){
                final TaskModel newTask = 
                TaskModel(id:DateTime.now().toString() ,
                title: taskTextEditingController.text,
                isCompelted: false
                );
                createTask(task: newTask);
                taskTextEditingController.clear();
                //close the dialog
                Navigator.of(context).pop();
              }

            }, 
            
            child:const Text('Save') )
          ],
        );
    }
    );
  }


  void createTask({required TaskModel task}){
    setState(() {
      tasksList.add(task);
      saveOnLocalStorage();
    });
  }

  void updateTask({required String taskId,required TaskModel updatedTask}){
    final taskIndex=tasksList.indexWhere((task)=>task.id==taskId);
    if(taskIndex !=-1){
    setState(() {
      tasksList[taskIndex]=updatedTask;
      saveOnLocalStorage();
    });}
  }

  void deleteTask({required String taskId}){
    setState(() {
      tasksList.removeWhere((task) => task.id==taskId);
      saveOnLocalStorage();

    });
  }

  
  void readTasks(){
    setState(() {  
      final taskData = sharedPreferences?.getStringList('tasks')??[];

      tasksList=taskData.map((taskJason)=>TaskModel.fromJson(taskJason)).toList();
    });
  }

  List<TaskModel> get displayedTasks {
  if (showCompletedTasks) {
    return tasksList.where((task) => task.isCompelted).toList();
  } else {
    return tasksList;
  }
}


  



}
