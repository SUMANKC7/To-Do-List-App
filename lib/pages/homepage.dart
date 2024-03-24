import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/data/database.dart';
import 'package:todo_list/util/dialogbox.dart';
import 'package:todo_list/util/listtile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox = Hive.box("mybox");
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    //if this is first time ever opening data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //there already exist data
      db.loadData();
    }
    super.initState();
  }

    //text controller
    final _controller = TextEditingController();
    //todo list tasks

    // checkbox is tapped
    void checkedBoxChanged(bool value, int index) {
      setState(() {
        db.toDoList[index][1] = !db.toDoList[index][1];
      });
      db.updateDatabase();
    }

    void saveNewTask() {
      setState(() {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
      db.updateDatabase();
    }

    void createNewTask() {
      showDialog(
          context: context,
          builder: (context) {
            return DialogBox(
              controller: _controller,
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop(),
            );
          });
    }

    //delete task
    void deleteTask(int index) {
      setState(() {
        db.toDoList.removeAt(index);
      });
      db.updateDatabase();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 234, 150),
        appBar: AppBar(
          title: const Text("To-Do-List"),
          backgroundColor: const Color.fromARGB(255, 239, 193, 65),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return ToDoList(
                taskname: db.toDoList[index][0],
                taskCompleted: db.toDoList[index][1],
                onChanged: (value) => checkedBoxChanged(value!, index),
                deleteFunction: (context) => deleteTask(index),
              );
            }),
        floatingActionButton: SafeArea(
          child: FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: createNewTask,
            child: Icon(Icons.add),
          ),
        ),
      );
    }
  }

