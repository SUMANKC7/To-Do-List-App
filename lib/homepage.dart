import 'package:flutter/material.dart';
import 'package:todo_list/listtile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do-List"),
        backgroundColor:const Color.fromARGB(255, 239, 193, 65),
        centerTitle: true,
        
      ),
      
      
      body: ListView.builder(itemBuilder: (context,index){}),
      
    );
  }
}

