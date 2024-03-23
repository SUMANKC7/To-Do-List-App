import 'package:flutter/material.dart';
import 'package:todo_list/listtile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //todo list tasks
  List toDoList = [
    ["Make Tutorial", false],
    ["Excersise", false],
  ];
  // checkbox is tapped
  void checkedBoxChanged(bool value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
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
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoList(
              taskname: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkedBoxChanged(value!, index),
            );
          }),
    );
  }
}
