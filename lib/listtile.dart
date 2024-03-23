import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 249, 234, 102),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Text("Flutter practice"),
      ),
    );
  }
}
