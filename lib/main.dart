import 'package:flutter/material.dart';
import 'package:todo_list/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "To-Do-List",
      home:const  HomePage(
        
      ),
      theme: ThemeData(primarySwatch:Colors.yellow  ),
    );
  }
}
